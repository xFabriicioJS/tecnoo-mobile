package com.tecnoo.helpdesk.Security.Usuario.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Repositories.UsuarioRepository;

@Service
public class UsuarioDetailsServiceImpl implements UserDetailsService{

    @Autowired
    private UsuarioRepository repository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = repository.findByLoginUsuario(username).orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado com esse login:  " + username));

    
        //retornará um userDetails
        return UsuarioDetailsImpl.build(usuario); 
    }
    
}
