package com.tecnoo.helpdesk.Models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;


import com.tecnoo.helpdesk.Models.Dtos.EnderecoDTO;
import lombok.Data;

@Entity @Table (name = "tbclientes") @Data
public class Cliente extends Pessoa{

    public Cliente(){}


    @Column(unique = true)
    private String cpf;


    private String telefone;


    private String cnpj;


    private String razaoSocial;

    private Long idTipo;

    @OneToOne(cascade = CascadeType.ALL)
    private Endereco endereco;

    @OneToOne
    private Plano plano;

    @OneToMany(mappedBy = "cliente")
    private List<Ticket> chamados = new ArrayList<>();

    @OneToMany(mappedBy = "cliente")
    private List<Descarte> descartes = new ArrayList<>();

    // private Foto fotoPerfil;


    public Cliente( String nome, String email, String loginUsuario, String senha, String cpf, String telefone,
                   String cnpj, String razaoSocial, Long idTipo, EnderecoDTO endereco){
        super(nome, email, loginUsuario, senha);
        this.cpf = cpf;
        this.telefone = telefone;
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
        this.idTipo = idTipo;
        this.endereco = new Endereco(endereco);
    }

}
