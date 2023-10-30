package com.tecnoo.helpdesk.Models;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;


@Entity
public class Usuario extends Pessoa {

    @OneToMany(mappedBy = "usuario")
    private List<HistoricoChamado> historicos = new ArrayList<>();

    public Usuario() {
    }

    public Usuario(String nome, String email, String loginUsuario, String senha) {
        super(nome, email, loginUsuario, senha);
    }
}
