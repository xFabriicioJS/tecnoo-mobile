package com.tecnoo.helpdesk.Models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.br.CNPJ;
import org.hibernate.validator.constraints.br.CPF;

import lombok.Data;

@Entity @Table (name = "tbclientes") @Data
public class Cliente {
    
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String cpf;

  
    private String telefone;

    
    private String cnpj;

 
    private String razaoSocial;

    private Long idTipo;

    @Column(unique = true)
    private String email;

    private String senha;

    @OneToOne
    private Endereco endereco;

    @OneToMany(mappedBy = "cliente")
    private List<Ticket> chamados = new ArrayList<>();

    // private Foto fotoPerfil;
}
