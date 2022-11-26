package com.tecnoo.helpdesk.Models;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Data
public class Plano {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull    
    private Plano plano;

    @NotNull
    private Cliente cliente;

    @NotNull
    private LocalDateTime dataContratacao;

    @NotNull
    private Double valor;

}
