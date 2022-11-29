package com.tecnoo.helpdesk.Models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;



import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tbusuarios")
@Data
@NoArgsConstructor
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String email;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "usuario_niveis",
    joinColumns = @JoinColumn(name = "usuario_id"),
    inverseJoinColumns = @JoinColumn(name = "nivel_id")
    )
    private Set<Nivel> niveis = new HashSet<>();

    @Column(unique = true)
    private String loginUsuario;

    private String senha;

    public Usuario(String nome, String email, String loginUsuario, String senha) {
        this.nome = nome;
        this.email = email;
        this.loginUsuario = loginUsuario;
        this.senha = senha;
    }

    // private Foto fotoPerfil;

    


}
