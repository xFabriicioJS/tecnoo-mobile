package com.tecnoo.helpdesk.Models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tbusuarios", uniqueConstraints = {
        @UniqueConstraint(columnNames = "loginUsuario"),
        @UniqueConstraint(columnNames = "email")
})
@Data
@NoArgsConstructor
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String email;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "usuario_niveis",
    joinColumns = @JoinColumn(name = "usuario_id"),
    inverseJoinColumns = @JoinColumn(name = "nivel_id")
    )
    private Set<Nivel> niveis = new HashSet<Nivel>();

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
