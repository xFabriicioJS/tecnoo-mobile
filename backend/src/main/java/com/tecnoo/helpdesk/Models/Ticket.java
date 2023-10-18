package com.tecnoo.helpdesk.Models;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;

import com.tecnoo.helpdesk.Models.Enums.Prioridade;
import com.tecnoo.helpdesk.Models.Enums.Status;
import com.tecnoo.helpdesk.Models.Enums.TipoAtendimento;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Data
@Entity
@Table(name = "tbchamados")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_chamado")
    private Long id;

    @NotBlank(message = "O campo protocolo é obrigatório")
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(unique = true)
    private String protocolo;

    private String titulo;

    @NotNull
    @ManyToOne
    private Cliente cliente;

    private LocalDateTime dataAbertura = LocalDateTime.now();

    private LocalDateTime dataFinalizacao;

    private LocalDateTime dataLimite;

    // private Foto fotoArquivo;

    private Status status = Status.ABERTO;

    private Prioridade prioridade;

    private TipoAtendimento tipoAtendimento;

    private String descricao;

    @PrePersist
    public void prePersist() {
        this.protocolo = generateProtocol();
    }

    private String generateProtocol() {
        LocalDateTime now = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");

        String formatedDate = now.format(formatter);

        String uuid = UUID.randomUUID().toString();

        return "TI-" + formatedDate + "-" + uuid.substring(0, 4);
    }
}
