package com.tecnoo.helpdesk.Security.Pessoa.Services;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import com.tecnoo.helpdesk.Models.Dtos.EnderecoDTO;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Pessoa;
import com.tecnoo.helpdesk.Models.Plano;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecnoo.helpdesk.Models.Usuario;

public class UsuarioDetailsImpl implements UserDetails {

    private Long id;
    private String loginUsuario;
    private String email;
    private String nome;
    @JsonIgnore
    private String senha;

    private String cpf;

    private String telefone;

    private String cnpj;

    private String razaoSocial;

    private Long idTipo;

    private EnderecoDTO endereco;

    private Plano plano;

    private Collection<? extends GrantedAuthority> authorities;

    // Construtor para usuário
    public UsuarioDetailsImpl(Long id, String loginUsuario, String email, String senha, String nome,
            Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.loginUsuario = loginUsuario;
        this.email = email;
        this.senha = senha;
        this.nome = nome;
        this.authorities = authorities;
    }

    // Construtor para cliente
    public UsuarioDetailsImpl(Long id, String loginUsuario, String email, String nome, String senha, String cpf,
            String telefone, String cnpj, String razaoSocial, Long idTipo, EnderecoDTO endereco,
            Plano plano, Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.loginUsuario = loginUsuario;
        this.email = email;
        this.nome = nome;
        this.senha = senha;
        this.cpf = cpf;
        this.telefone = telefone;
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
        this.idTipo = idTipo;
        this.endereco = endereco;
        this.plano = plano;
        this.authorities = authorities;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public Long getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Long idTipo) {
        this.idTipo = idTipo;
    }

    public EnderecoDTO getEndereco() {
        return endereco;
    }

    public void setEndereco(EnderecoDTO endereco) {
        this.endereco = endereco;
    }

    public Plano getPlano() {
        return plano;
    }

    public void setPlano(Plano plano) {
        this.plano = plano;
    }

    public static UsuarioDetailsImpl build(Pessoa pessoa) {
        // Pegando as "roles" do usuário, os níveis e armazenado no atributo authorities
        List<GrantedAuthority> authorities = pessoa.getNiveis().stream()
                .map(nivel -> new SimpleGrantedAuthority(nivel.getNome().name()))
                .collect(Collectors.toList());

        System.out.println(authorities);

        if (authorities.contains(new SimpleGrantedAuthority("TECNICO"))) {
            return new UsuarioDetailsImpl(pessoa.getId(), pessoa.getLoginUsuario(), pessoa.getEmail(),
                    pessoa.getSenha(), pessoa.getNome(), authorities);
        }

        Cliente cliente = (Cliente) pessoa;

        // Retornando para quem chamou um objeto UsuarioDetailsImpl
        return new UsuarioDetailsImpl(
                cliente.getId(),
                cliente.getLoginUsuario(),
                cliente.getEmail(),
                cliente.getNome(),
                cliente.getSenha(),
                cliente.getCpf(),
                cliente.getTelefone(),
                cliente.getCnpj(),
                cliente.getRazaoSocial(),
                cliente.getIdTipo(),
                cliente.getEnderecoDTO(),
                cliente.getPlano(),
                authorities);
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
