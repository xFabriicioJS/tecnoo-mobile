package com.tecnoo.helpdesk.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Data
@Table (name = "tbendereco")
public class Endereco {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(mappedBy = "endereco")
    @NotNull
    private Cliente cliente;

    @NotBlank(message = "O campo cep é obrigatório")
    @Size(min = 8, max = 8, message = "O campo cep deve ter 8 caracteres")
    private String cep;

    @NotBlank(message = "O campo logradouro é obrigatório")
    @Size(min = 5, max = 50, message = "O campo logradouro deve ter entre 5 e 50 caracteres")
    private String logradouro;

    @Size(min = 1, max = 10, message = "O campo numero deve ter entre 1 e 10 caracteres")
    @NotBlank(message = "O campo número é obrigatório")
    private String numero;

    @Size(min = 1, max = 50, message = "O campo complemento deve ter entre 1 e 50 caracteres")
    @NotBlank(message = "O campo complemento é obrigatório")
    private String complemento;

    @Size(min = 1, max = 50, message = "O campo bairro deve ter entre 1 e 50 caracteres")
    @NotBlank(message = "O campo bairro é obrigatório")
    private String bairro;

    @Size(min = 1, max = 50, message = "O campo cidade deve ter entre 1 e 50 caracteres")
    @NotBlank(message = "O campo cidade é obrigatório")
    private String cidade;

    @Size(min = 2, max = 2, message = "O campo estado deve ter 2 caracteres")
    @NotBlank(message = "O campo estado é obrigatório")
    private String estado;

    

}
