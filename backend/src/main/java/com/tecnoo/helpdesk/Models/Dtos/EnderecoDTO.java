package com.tecnoo.helpdesk.Models.Dtos;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Endereco;
import com.tecnoo.helpdesk.Services.ClienteService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;

@Data
public class EnderecoDTO {

    @Autowired
    private ClienteService clienteService;

    private Long id;

    @NotBlank(message = "O campo cep é obrigatório")
    @Size(min = 8, max = 8, message = "O campo cep deve ter 8 caracteres")
    private String cep;

    @NotBlank(message = "O campo logradouro é obrigatório")
    @Size(min = 5, max = 50, message = "O campo logradouro deve ter entre 5 e 50 caracteres")
    private String logradouro;

    @Size(min = 1, max = 10, message = "O campo numero deve ter entre 1 e 10 caracteres")
    @NotBlank(message = "O campo número é obrigatório")
    private String numero;

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

    public EnderecoDTO() {
    }

    // Construtor para conversão de um Endereço normal em Endereço DTO
    public EnderecoDTO(Endereco endereco) {
        this.id = endereco.getId();
        this.cep = endereco.getCep();
        this.logradouro = endereco.getLogradouro();
        this.numero = endereco.getNumero();
        this.complemento = endereco.getComplemento();
        this.bairro = endereco.getBairro();
        this.cidade = endereco.getCidade();
        this.estado = endereco.getEstado();
    }

    // Retorna um cliente com base no Id
    public Cliente findClienteById(Long id) {
        return clienteService.findById(id);
    }

}
