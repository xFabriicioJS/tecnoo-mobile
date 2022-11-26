package com.tecnoo.helpdesk.Models.Dtos;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Models.Enums.Nivel;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsuarioDTO {

    private Long id;

    @NotBlank(message = "O campo nome é obrigatório")
    @Size(min = 5, max = 50, message = "O campo nome deve ter entre 5 e 50 caracteres")
    private String nome;

    @NotBlank(message = "O campo email é obrigatório")
    @Size(min = 5, max = 50, message = "O campo email deve ter entre 5 e 50 caracteres")
    private String email;

    @NotNull(message = "O campo nivel é obrigatório")
    private Nivel nivel;

    @NotBlank(message = "O campo loginUsuario é obrigatório")
    @Size(min = 5, max = 50, message = "O campo loginUsuario deve ter entre 5 e 50 caracteres")
    private String loginUsuario;

    @NotBlank(message = "O campo senha é obrigatório")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String senha;

    // private Foto fotoPerfil;

    public UsuarioDTO() {
    }

    // Construtor para a conversão de um usuario para um usuarioDTO
    public UsuarioDTO(Usuario usuario) {
        this.id = usuario.getId();
        this.nome = usuario.getNome();
        this.nivel = usuario.getNivel();
        this.loginUsuario = usuario.getLoginUsuario();
        this.senha = usuario.getSenha();
    }

}
