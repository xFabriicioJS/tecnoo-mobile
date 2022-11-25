package com.tecnoo.helpdesk.Models;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.tecnoo.helpdesk.Models.Enums.Status;

import lombok.Data;

@Entity
@Data
@Table(name = "tbdescarte")
public class Descarte {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String protocolo;

    private String descricao;

    private String nomeHardware;

    private Cliente cliente;

    private LocalDateTime dataAbertura = LocalDateTime.now();

    private LocalDateTime dataRetirada;

    private LocalDateTime prazo;

    // private Foto foto;

    private Status status = Status.ABERTO;


}
