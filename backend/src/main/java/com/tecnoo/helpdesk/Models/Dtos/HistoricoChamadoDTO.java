package com.tecnoo.helpdesk.Models.Dtos;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.tecnoo.helpdesk.Models.HistoricoChamado;
import com.tecnoo.helpdesk.Models.Usuario;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class HistoricoChamadoDTO {

    private Long id;

    private Long idChamado;

    @NotBlank(message = "O campo descrição é obrigatório")
    private String descricao;

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    private LocalDateTime dataHistorico = LocalDateTime.now();

    public HistoricoChamadoDTO (HistoricoChamado historico) {
        this.id = historico.getId();
        this.idChamado = historico.getChamado().getId();
        this.descricao = historico.getDescricao();
        this.dataHistorico = historico.getDataHistorico();
        this.usuario = new UsuarioDTO(historico.getUsuario());
    }

    private UsuarioDTO usuario;

}
