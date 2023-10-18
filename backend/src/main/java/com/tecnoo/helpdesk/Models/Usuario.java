package com.tecnoo.helpdesk.Models;

import javax.persistence.*;

@Entity
public class Usuario extends Pessoa {

    public Usuario() {
    }

    public Usuario(String nome, String email, String loginUsuario, String senha) {
        super(nome, email, loginUsuario, senha);
    }
}
