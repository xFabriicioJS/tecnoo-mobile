package com.tecnoo.helpdesk.Models;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
public abstract class Pessoa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String email;

    @Column(unique = true)
    private String loginUsuario;

    private String senha;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "usuario_niveis",
            joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "nivel_id")
    )
    private Set<Nivel> niveis = new HashSet<Nivel>();

    public Pessoa(String nome, String email, String loginUsuario, String senha, Set<Nivel> niveis) {
        this.nome = nome;
        this.email = email;
        this.loginUsuario = loginUsuario;
        this.senha = senha;
        this.niveis = niveis;
    }

    public Pessoa(String nome, String email, String loginUsuario, String senha) {
        this.nome = nome;
        this.email = email;
        this.loginUsuario = loginUsuario;
        this.senha = senha;
    }

    public Pessoa() {

    }

    //private FotoPerfil fotoperfil
}
