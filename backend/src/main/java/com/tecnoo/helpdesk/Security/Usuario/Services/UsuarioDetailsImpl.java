package com.tecnoo.helpdesk.Security.Usuario.Services;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecnoo.helpdesk.Models.Usuario;

public class UsuarioDetailsImpl implements UserDetails{

    private Long id;
    private String loginUsuario;
    private String email;
    private String nome;

    @JsonIgnore
    private String senha;

    private Collection<? extends GrantedAuthority> authorities;

    public UsuarioDetailsImpl(Long id, String loginUsuario, String email, String senha, String nome,
            Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.loginUsuario = loginUsuario;
        this.email = email;
        this.senha = senha;
        this.nome = nome;
        this.authorities = authorities;
    }

    public static UsuarioDetailsImpl build(Usuario usuario){
        //Pegando as "roles" do usuário, os níveis e armazenado no atributo authorities
        List<GrantedAuthority> authorities = usuario.getNiveis().stream()
                .map(nivel -> new SimpleGrantedAuthority(nivel.getNome().name()))
                .collect(Collectors.toList());

        //Retornando para quem chamou um objeto UsuarioDetailsImpl
        return new UsuarioDetailsImpl(usuario.getId(), usuario.getLoginUsuario(), usuario.getEmail(),
                usuario.getSenha(), usuario.getNome(), authorities);
    }

    public Long getId() {
        return id;
    }
    

    public String getLoginUsuario() {
        return loginUsuario;
    }

    public String getEmail() {
        return email;
    }

    public String getSenha() {
        return senha;
    }

    
    public void setId(Long id) {
        this.id = id;
    }

    public void setLoginUsuario(String loginUsuario) {
        this.loginUsuario = loginUsuario;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return senha;
    }

    @Override
    public String getUsername() {
        return loginUsuario;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
       return true;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }



    
}
