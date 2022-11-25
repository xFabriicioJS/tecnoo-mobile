package com.tecnoo.helpdesk.Models;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

import com.tecnoo.helpdesk.Models.Enums.Prioridade;
import com.tecnoo.helpdesk.Models.Enums.Status;
import com.tecnoo.helpdesk.Models.Enums.TipoAtendimento;

import java.time.LocalDateTime;

@Data @Entity @Table(name = "tbchamados")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_chamado")
    private Long id;

    @NotBlank(message = "O campo protocolo é obrigatório") @Size(min = 5, max = 100)
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(unique = true)
    private String protocolo;

    @NotBlank(message = "O campo título é obrigatório") @Size(min = 5, max = 100)
    private String titulo;

    @NotNull @ManyToOne
    private Cliente cliente;

    @NotBlank (message = "Uma data de abertura é obrigatória")
    private LocalDateTime dataAbertura;

    private LocalDateTime dataFinalizacao;

    @NotBlank (message = "O campo data Limite é obrigatório")
    private LocalDateTime dataLimite;

    // private Foto fotoArquivo;

    @NotBlank (message = "O campo status é obrigatório")
    private Status status;

    @NotBlank (message = "Prioridade é obrigatório")
    private Prioridade prioridade;

    @NotBlank (message = "Local do atendimento é obrigatório")
    private TipoAtendimento tipoAtendimento;


}
