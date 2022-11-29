package com.tecnoo.helpdesk.Security.Usuario.AuthPayload.request;

import javax.validation.constraints.NotBlank;

//Classe que define o payload(modelo) para fazer um login com um usuário, nesse caso, o usuário e senha.
public class LoginRequest {
    
    @NotBlank(message = "O login de usuário não pode ser em branco")
    private String loginUsuario;

    @NotBlank(message = "A senha não pode ser em branco")
    private String senha;

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

    
}
