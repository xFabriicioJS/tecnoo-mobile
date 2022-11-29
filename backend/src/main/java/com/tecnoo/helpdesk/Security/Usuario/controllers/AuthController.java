package com.tecnoo.helpdesk.Security.Usuario.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Nivel;
import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Models.Enums.ENivel;
import com.tecnoo.helpdesk.Repositories.NivelRepository;
import com.tecnoo.helpdesk.Repositories.UsuarioRepository;
import com.tecnoo.helpdesk.Security.Usuario.AuthPayload.request.LoginRequest;
import com.tecnoo.helpdesk.Security.Usuario.AuthPayload.request.SignupRequest;
import com.tecnoo.helpdesk.Security.Usuario.AuthPayload.response.JwtResponse;
import com.tecnoo.helpdesk.Security.Usuario.AuthPayload.response.MessageResponse;
import com.tecnoo.helpdesk.Security.Usuario.Jwt.JwtUtils;
import com.tecnoo.helpdesk.Security.Usuario.Services.UsuarioDetailsImpl;

//Classe que gerencia as requisições para os endpoints de autenticação.

@RestController
@CrossOrigin("*")
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    NivelRepository nivelRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUsuario(@Valid @RequestBody LoginRequest loginRequest){
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getLoginUsuario(), loginRequest.getSenha()));

                SecurityContextHolder.getContext().setAuthentication(authentication);
                String jwtString = jwtUtils.generateJwtToken(authentication);


                UsuarioDetailsImpl detalhesUsuario = (UsuarioDetailsImpl) authentication.getPrincipal();

                List<String> niveis = detalhesUsuario.getAuthorities().stream().map(nivel -> nivel.getAuthority())
                        .collect(Collectors.toList());
            
                
                //Retornará um ResponseEntity com todas as informações do usuário
                return ResponseEntity.ok(new JwtResponse(jwtString, detalhesUsuario.getId(),
                        detalhesUsuario.getLoginUsuario(),
                        detalhesUsuario.getEmail(), niveis,
                        detalhesUsuario.getNome()
                ));

    }

    @PostMapping("/cadastro")
    public ResponseEntity<?> registerUsuario(@Valid @RequestBody SignupRequest signupRequest){

        //Fazendo algumas validações, como por exemplo, se existem usuários já cadastrados com o login informado,
        // ou com o email informado
        if(usuarioRepository.existsByLoginUsuario(signupRequest.getLoginUsuario())){
            return ResponseEntity
            .badRequest()
            .body(new MessageResponse("Esse login de usuário já está em uso!"));
        }

        if(usuarioRepository.existsByEmail(signupRequest.getEmail())){
            return ResponseEntity
            .badRequest()
            .body("Já existe um usuário cadastrado com esse email, por favor tente outro!");
        }

        //Caso passe em todas as validações, prosseguimos com o código.

        //Instanciamos um usuário
        Usuario usuario = new Usuario(signupRequest.getNome(), signupRequest.getEmail(),
                signupRequest.getLoginUsuario(),
                encoder.encode(signupRequest.getSenha()));

        Set<String> stringNiveis = signupRequest.getNivel();
        Set<Nivel> niveis = new HashSet<>();

        if(stringNiveis == null){
            Nivel nivelTecnico = nivelRepository.findByNome(ENivel.TECNICO)
                    .orElseThrow(
                            ()-> new ResourceNotFoundException("Nível não encontrado. Nivel: "
                                    + ENivel.TECNICO.getClass()
                                    .getName()));

            //Caso realmente exista o nivel Técnico no banco de dados, adicionamos o nivel
            // técnico a nossa instância de usuário para depois salvá-la
            niveis.add(nivelTecnico);
        }else{
            stringNiveis.forEach(nivel -> {
                switch (nivel) {
                    case "admin":
                        Nivel admin = nivelRepository.findByNome(ENivel.ADMINISTRADOR).orElseThrow(
                                ()-> new ResourceNotFoundException("Nivel administrador não encontrado"));

                        niveis.add(admin);
                        break;

                    case "supervisor":
                        Nivel supervisor = nivelRepository
                                .findByNome(ENivel.SUPERVISOR).orElseThrow(
                                        ()-> new ResourceNotFoundException("Nivel supervisor não encontrado"));
                        
                        niveis.add(supervisor);
                        break;
                    case "tecnico":
                        Nivel tecnico = nivelRepository.findByNome(ENivel.TECNICO)
                                .orElseThrow(()-> new ResourceNotFoundException("Nivel técnico não encontrado."));
                        
                        niveis.add(tecnico);
                        break;
                    default:
                        Nivel tecnicoDefault = nivelRepository.findByNome(ENivel.TECNICO)
                                .orElseThrow(()-> new ResourceNotFoundException("Nivel técnico não encontrado"));
                        
                        niveis.add(tecnicoDefault);
                    }   
                    
            });
        }
        //Atribuimos os seus niveis
        usuario.setNiveis(niveis);
        //Salvamos o usuário no BD
        usuarioRepository.save(usuario);
        //Retornamos um 200OK
        return ResponseEntity.ok(new MessageResponse("Usuário registrado com sucesso"));

    }


    
}
