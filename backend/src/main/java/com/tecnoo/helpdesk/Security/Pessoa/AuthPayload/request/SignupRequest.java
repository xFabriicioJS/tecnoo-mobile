package com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.request;

import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonProperty;

//Classe que define o payload(modelo) para fazer um cadastro com um usuário, nesse caso, o login de usuário, email, senha, niveis, nome

public class SignupRequest {

    @NotBlank(message = "O campo nome é obrigatório")
    @Size(min = 5, max = 50, message = "O campo nome deve ter entre 5 e 50 caracteres")
    private String nome;

    @NotBlank(message = "O campo email é obrigatório")
    @Size(min = 5, max = 50, message = "O campo email deve ter entre 5 e 50 caracteres")
    private String email;

    @NotNull(message = "O campo nivel é obrigatório")
    private Set<String> nivel;

    @NotBlank(message = "O campo loginUsuario é obrigatório")
    @Size(min = 5, max = 50, message = "O campo loginUsuario deve ter entre 5 e 50 caracteres")
    private String loginUsuario;

    @NotBlank(message = "O campo senha é obrigatório")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String senha;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginUsuario() {
        return loginUsuario;
    }

    public void setLoginUsuario(String loginUsuario) {
        this.loginUsuario = loginUsuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Set<String> getNivel() {
        return nivel;
    }

    public void setNivel(Set<String> nivel) {
        this.nivel = nivel;
    }

}
