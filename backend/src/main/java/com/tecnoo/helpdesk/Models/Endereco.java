package com.tecnoo.helpdesk.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.tecnoo.helpdesk.Models.Dtos.EnderecoDTO;
import lombok.Data;

@Entity
@Data
@Table (name = "tbendereco")
public class Endereco {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

/*    @OneToOne(mappedBy = "endereco")
    @NotNull
    private Cliente cliente;*/

    private String cep;

    private String logradouro;

    private String numero;

    private String complemento;

    private String bairro;

    private String cidade;


    private String estado;


    public Endereco( String cep, String logradouro, String numero, String complemento, String bairro, String cidade, String estado){
/*
        this.cliente = cliente;
*/
        this.cep = cep;
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
    }

    //Construtor que converte um Endereco em EnderecoDTO
    public Endereco(EnderecoDTO enderecoDTO){
     /*   this.cliente = enderecoDTO.findClienteById(enderecoDTO.getIdCliente());*/
        this.cep = enderecoDTO.getCep();
        this.logradouro = enderecoDTO.getLogradouro();
        this.numero = enderecoDTO.getNumero();
        this.complemento = enderecoDTO.getComplemento();
        this.bairro = enderecoDTO.getBairro();
        this.cidade = enderecoDTO.getCidade();
        this.estado = enderecoDTO.getEstado();
    }


    public Endereco() {

    }
}
