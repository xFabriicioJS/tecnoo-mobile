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

import com.tecnoo.helpdesk.Models.Dtos.ClienteDTO;

import lombok.Data;

@Entity @Table (name = "tbclientes") @Data
public class Cliente {

    public Cliente(){}


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

    @OneToOne
    private Plano plano;

    @OneToMany(mappedBy = "cliente")
    private List<Ticket> chamados = new ArrayList<>();

    @OneToMany(mappedBy = "cliente")
    private List<Descarte> descartes = new ArrayList<>();

    // private Foto fotoPerfil;

    public Cliente(ClienteDTO clienteDTO) {
        this.nome = clienteDTO.getNome();
        this.cpf = clienteDTO.getCpf();
        this.telefone = clienteDTO.getTelefone();
        this.cnpj = clienteDTO.getCnpj();
        this.razaoSocial = clienteDTO.getRazaoSocial();
        this.idTipo = clienteDTO.getIdTipo();
        this.email = clienteDTO.getEmail();
    }

}
