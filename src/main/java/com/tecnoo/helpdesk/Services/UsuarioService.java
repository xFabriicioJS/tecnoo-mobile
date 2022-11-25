package com.tecnoo.helpdesk.Services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Models.Dtos.UsuarioDTO;
import com.tecnoo.helpdesk.Repositories.UsuarioRepository;

@Service
public class UsuarioService {
    
    @Autowired
    private UsuarioRepository repository;

    public Usuario findById(Long id){
        Optional<Usuario> usuario = repository.findById(id);

        return usuario.orElseThrow(()-> new ResourceNotFoundException("Usuario não encontrado"));
    }


    public List<Usuario> findAll(){
        return repository.findAll();
    }

    public Usuario update(Long id, @Valid UsuarioDTO usuario){
        Usuario usuarioAserAtualizado = findById(id);


        //Executando algumas verificações para conferir se o CPF e Email passados não são possuidos por outro usuario. 
        
        if(findByEmail(usuario.getEmail()) != null && findByEmail(usuario.getEmail()).getId() != id){
            throw new DataIntegrityViolationException("Email já cadastrado no sistema!");
        }

        //Caso passe nessas verificações...
        usuarioAserAtualizado.setNome(usuario.getNome());
        usuarioAserAtualizado.setEmail(usuario.getEmail());
        usuarioAserAtualizado.setNivel(usuario.getNivel());
        usuarioAserAtualizado.setLoginUsuario(usuario.getLoginUsuario());

        return repository.saveAndFlush(usuarioAserAtualizado);
    }

    public Usuario findByEmail(String email){
        Usuario usuario = repository.findByEmail(email);
        if(usuario != null){
            return usuario;

        }

        return null;
    }

    public Usuario findByLoginUsuario(String loginUsuario){
        Usuario usuario = repository.findByLoginUsuario(loginUsuario);

        if(usuario != null){
            return usuario;
        }
        return null;
    }

    


}
