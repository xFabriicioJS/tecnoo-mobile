package com.tecnoo.helpdesk.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


import com.tecnoo.helpdesk.Models.Enums.Nivel;

import lombok.Data;

@Entity
@Table(name = "tbusuarios")
@Data
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String email;

    private Nivel nivel;

    @Column(unique = true)
    private String loginUsuario;

    private String senha;

    // private Foto fotoPerfil;



}
