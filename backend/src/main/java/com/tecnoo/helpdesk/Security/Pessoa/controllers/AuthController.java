package com.tecnoo.helpdesk.Security.Pessoa.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import com.tecnoo.helpdesk.Models.Cliente;

import com.tecnoo.helpdesk.Repositories.ClienteRepository;
import com.tecnoo.helpdesk.Repositories.PessoaRepository;
import com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.request.SignupRequestCliente;
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
import com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.request.LoginRequest;
import com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.request.SignupRequest;
import com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.response.JwtResponse;
import com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.response.MessageResponse;
import com.tecnoo.helpdesk.Security.Pessoa.Jwt.JwtUtils;
import com.tecnoo.helpdesk.Security.Pessoa.Services.UsuarioDetailsImpl;

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
    PessoaRepository pessoaRepository;

    @Autowired
    NivelRepository nivelRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    ClienteRepository clienteRepository;

    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/cliente/signin")
    public ResponseEntity<?> authenticateCliente(@Valid @RequestBody LoginRequest loginRequest){
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getLoginUsuario(), loginRequest.getSenha()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwtString = jwtUtils.generateJwtToken(authentication);


        UsuarioDetailsImpl detalhesCliente = (UsuarioDetailsImpl) authentication.getPrincipal();

        List<String> niveis = detalhesCliente.getAuthorities().stream().map(nivel -> nivel.getAuthority())
                .collect(Collectors.toList());


        //Retornará um ResponseEntity com todas as informações do cliente
        return ResponseEntity.ok(new JwtResponse(
                jwtString,
                detalhesCliente.getId(),
                detalhesCliente.getUsername(),
                detalhesCliente.getEmail(),
                detalhesCliente.getNome(),
                niveis,
                detalhesCliente.getCpf(),
                detalhesCliente.getTelefone(),
                detalhesCliente.getCnpj(),
                detalhesCliente.getRazaoSocial(),
                detalhesCliente.getIdTipo(),
                detalhesCliente.getEndereco(),
                detalhesCliente.getPlano()
        ));
    }

    @PostMapping("/usuario/signin")
    public ResponseEntity<?> authenticateUsuario(@Valid @RequestBody LoginRequest loginRequest){
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getLoginUsuario(), loginRequest.getSenha()));

                SecurityContextHolder.getContext().setAuthentication(authentication);
                String jwtString = jwtUtils.generateJwtToken(authentication);


                UsuarioDetailsImpl detalhesUsuario = (UsuarioDetailsImpl) authentication.getPrincipal();

                List<String> niveis = detalhesUsuario.getAuthorities().stream().map(nivel -> nivel.getAuthority())
                        .collect(Collectors.toList());
            
                
                //Retornará um ResponseEntity com todas as informações do usuário
                return ResponseEntity.ok(new JwtResponse(jwtString,
                        detalhesUsuario.getId(),
                        detalhesUsuario.getLoginUsuario(),
                        detalhesUsuario.getEmail(),
                        niveis,
                        detalhesUsuario.getNome()
                ));

    }

    @PostMapping("/cliente/cadastro")
    public ResponseEntity<?> registerCliente(@Valid @RequestBody SignupRequestCliente signupRequestCliente){

        //Fazendo algumas validações, por exemplo, se existem clientes já cadastrados com o "login" informado,
        // ou com o email informado
        if(pessoaRepository.existsByLoginUsuario(signupRequestCliente.getLoginUsuario())){
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Esse login de usuário já está em uso!"));
        }


        if(pessoaRepository.existsByEmail(signupRequestCliente.getEmail())){
            return ResponseEntity
                    .badRequest()
                    .body("Já existe um usuário cadastrado com esse email, por favor tente outro!");
        }

        //Caso passe em todas as validações, prosseguimos com o código.

        //Instanciamos um cliente
        Cliente cliente = new Cliente(signupRequestCliente.getNome(), signupRequestCliente.getEmail(),
                signupRequestCliente.getLoginUsuario(),
                encoder.encode(signupRequestCliente.getSenha()), signupRequestCliente.getCpf(),
                signupRequestCliente.getTelefone(),
                signupRequestCliente.getCnpj(), signupRequestCliente.getRazaoSocial(), signupRequestCliente.getIdTipo(),
                signupRequestCliente.getEndereco());

        Set<Nivel> niveis = new HashSet<>();
        Nivel nivelCliente = nivelRepository.findByNome(ENivel.CLIENTE).orElseThrow(
                ()->new ResourceNotFoundException("Nível cliente não encontrado")
        );

        niveis.add(nivelCliente);
        //Atribuimos os seus niveis
        cliente.setNiveis(niveis);

        clienteRepository.save(cliente);
        //Retornamos um 200 OK
        return ResponseEntity.ok(new MessageResponse("Cliente registrado com sucesso"));

    }

    @PostMapping("/usuario/cadastro")
    public ResponseEntity<?> registerUsuario(@Valid @RequestBody SignupRequest signupRequest){

        //Fazendo algumas validações, por exemplo, se existem usuários já cadastrados com o login informado,
        // ou com o email informado
        if(pessoaRepository.existsByLoginUsuario(signupRequest.getLoginUsuario())){
            return ResponseEntity
            .badRequest()
            .body(new MessageResponse("Esse login de usuário já está em uso!"));
        }

        if(pessoaRepository.existsByEmail(signupRequest.getEmail())){
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
