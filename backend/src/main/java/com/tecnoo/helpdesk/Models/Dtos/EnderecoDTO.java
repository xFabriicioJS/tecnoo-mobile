package com.tecnoo.helpdesk.Models.Dtos;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class EnderecoDTO {

    
    private Long id;

    private Long idCliente;

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
