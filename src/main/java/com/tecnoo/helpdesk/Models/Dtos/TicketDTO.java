package com.tecnoo.helpdesk.Models.Dtos;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.tecnoo.helpdesk.Models.Ticket;
import com.tecnoo.helpdesk.Models.Enums.Prioridade;
import com.tecnoo.helpdesk.Models.Enums.Status;
import com.tecnoo.helpdesk.Models.Enums.TipoAtendimento;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class TicketDTO {
 
    private Long id;

    private String protocolo;

    @NotBlank(message = "O campo título é obrigatório") @Size(min = 5, max = 100)
    private String titulo;

    @NotNull
    private Long idcliente;

    @NotBlank (message = "Uma data de abertura é obrigatória")
    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    private LocalDateTime dataAbertura;

    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    private LocalDateTime dataFinalizacao;

    @JsonFormat(pattern = "dd/MM/yyyy HH:mm")
    @NotBlank (message = "O campo data Limite é obrigatório")
    private LocalDateTime dataLimite;

    
    @NotBlank (message = "O campo status é obrigatório")
    private Status status;
    
    @NotBlank (message = "Prioridade é obrigatório")
    private Prioridade prioridade;
    
    @NotBlank (message = "Local do atendimento é obrigatório")
    private TipoAtendimento tipoAtendimento;

    // private Foto fotoArquivo;
    
    public TicketDTO() {
    }
    
    public TicketDTO(Ticket ticket) {
        this.id = ticket.getId();
        this.titulo = ticket.getTitulo();
        this.protocolo = ticket.getProtocolo();
        this.idcliente = ticket.getCliente().getId();
        this.dataAbertura = ticket.getDataAbertura();
        this.dataFinalizacao = ticket.getDataFinalizacao();
        this.dataLimite = ticket.getDataLimite();
        this.status = ticket.getStatus();
        this.prioridade = ticket.getPrioridade();
        this.tipoAtendimento = ticket.getTipoAtendimento();
    }
    
}
