package com.tecnoo.helpdesk.Security.Pessoa.Services;

import com.tecnoo.helpdesk.Models.Pessoa;
import com.tecnoo.helpdesk.Repositories.ClienteRepository;
import com.tecnoo.helpdesk.Repositories.PessoaRepository;
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
    private PessoaRepository repository;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Pessoa pessoa = repository.findByLoginUsuario(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado com esse login:  " + username));

    
        //retornará um userDetails
        return UsuarioDetailsImpl.build(pessoa);
    }
    
}
