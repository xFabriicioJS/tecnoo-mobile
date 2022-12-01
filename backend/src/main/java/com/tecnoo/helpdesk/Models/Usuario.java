package com.tecnoo.helpdesk.Models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


import lombok.Data;
import lombok.NoArgsConstructor;



@Entity
public class Usuario extends Pessoa {

    public Usuario(){}

    public Usuario(String nome, String email, String loginUsuario, String senha) {
        super(nome, email, loginUsuario, senha);
    }
}
