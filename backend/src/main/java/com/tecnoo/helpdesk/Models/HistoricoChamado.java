package com.tecnoo.helpdesk.Models;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.tecnoo.helpdesk.Models.Dtos.HistoricoChamadoDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tbhistorico")
@Data
@NoArgsConstructor
public class HistoricoChamado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_chamado")
    private Ticket chamado;

    @NotBlank(message = "O campo descrição é obrigatório")
    private String descricao;

    private LocalDateTime dataHistorico = LocalDateTime.now();

    @ManyToOne
    @JoinColumn(
        name = "id_usuario",
        referencedColumnName = "id"
    )
    private Usuario usuario;

    public HistoricoChamado(HistoricoChamadoDTO historicoChamado) {
        this.chamado.setId(historicoChamado.getIdChamado());
        this.descricao = historicoChamado.getDescricao();
        this.dataHistorico = historicoChamado.getDataHistorico();
    }

}
