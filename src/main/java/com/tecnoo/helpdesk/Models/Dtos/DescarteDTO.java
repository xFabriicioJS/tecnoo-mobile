package com.tecnoo.helpdesk.Models.Dtos;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.tecnoo.helpdesk.Models.Descarte;
import com.tecnoo.helpdesk.Models.Enums.Status;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DescarteDTO {
    
    private Long id;

    private String protocolo;

    @NotBlank(message = "Descrição é obrigatória")
    @Size(min = 5, max = 50, message = "Descrição deve ter entre 5 e 255 caracteres")
    private String descricao;

    @NotBlank
    @Size(min = 5, max = 50, message = "O campo nome deve ter entre 5 e 50 caracteres")
    private String nomeHardware;

    @NotNull
    private Long idCliente;

    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    private LocalDateTime dataAbertura;

    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    private LocalDateTime dataRetirada;

    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    private LocalDateTime prazo;

    // private Foto foto;
    private Status status;

    public DescarteDTO() {
    }

    public DescarteDTO(Descarte descarte){
        this.id = descarte.getId();
        this.protocolo = descarte.getProtocolo();
        this.descricao = descarte.getDescricao();
        this.nomeHardware = descarte.getNomeHardware();
        this.idCliente = descarte.getCliente().getId();
        this.dataAbertura = descarte.getDataAbertura();
        this.dataRetirada = descarte.getDataRetirada();
        this.prazo = descarte.getPrazo();
        this.status = descarte.getStatus();
    }
    
}
