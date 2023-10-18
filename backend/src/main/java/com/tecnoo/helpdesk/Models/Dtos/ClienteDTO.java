package com.tecnoo.helpdesk.Models.Dtos;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.br.CNPJ;
import org.hibernate.validator.constraints.br.CPF;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Security.Pessoa.Services.UsuarioDetailsImpl;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClienteDTO {

    private Long id;

    @NotBlank(message = "O nome é obrigatório")
    @Size(min = 5, max = 100, message = "O nome deve ter entre 5 e 100 caracteres")
    private String nome;

    @NotBlank(message = "O CPF é obrigatório")
    @CPF(message = "O CPF deve ser válido")
    private String cpf;

    @Size(min = 5, max = 14, message = "O telefone deve ter entre 5 e 14 caracteres")
    @NotBlank(message = "O telefone é obrigatório")
    private String telefone;

    @CNPJ(message = "O CNPJ deve ser válido")
    private String cnpj;

    @Size(min = 5, max = 100, message = "O nome da empresa deve ter entre 5 e 100 caracteres")
    private String razaoSocial;

    @NotNull
    @NotBlank(message = "O tipo do cliente é obrigatório")
    private Long idTipo;

    @Email(message = "O email deve ser válido")
    @Size(min = 5, max = 100, message = "O email deve ter entre 5 e 100 caracteres")
    private String email;

    @NotBlank(message = "A senha é obrigatória")
    @Size(min = 5, max = 30, message = "A senha deve ter entre 5 e 30 caracteres")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String senha;

    @NotNull
    @NotBlank(message = "Endereço é obrigatório")
    private EnderecoDTO endereco;

    // private Foto fotoPerfil;

    public ClienteDTO() {
    }

    public ClienteDTO(UsuarioDetailsImpl user) {
        this.id = user.getId();
        this.nome = user.getNome();
        this.cpf = user.getCpf();
        this.telefone = user.getTelefone();
        this.cnpj = user.getCnpj();
        this.razaoSocial = user.getRazaoSocial();
        this.idTipo = user.getIdTipo();
        this.email = user.getEmail();
        this.senha = user.getSenha();
        this.endereco = user.getEndereco();
    }

    // construtor para a conversão de um cliente para um clienteDTO
    public ClienteDTO(Cliente cliente) {
        this.id = cliente.getId();
        this.nome = cliente.getNome();
        this.cpf = cliente.getCpf();
        this.telefone = cliente.getTelefone();
        this.cnpj = cliente.getCnpj();
        this.razaoSocial = cliente.getRazaoSocial();
        this.idTipo = cliente.getIdTipo();
        this.email = cliente.getEmail();
        this.senha = cliente.getSenha();
        this.endereco = new EnderecoDTO(cliente.getEndereco());
    }

}
