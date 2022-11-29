package com.tecnoo.helpdesk.Models;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.tecnoo.helpdesk.Models.Enums.EPlano;

import lombok.Data;

@Entity
@Data
@Table(name = "planos")
public class Plano {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull    
    private EPlano nomePlano = EPlano.SEM_PLANO;

    @NotNull
    @OneToOne(mappedBy = "plano")
    private Cliente cliente;

    @NotNull
    private LocalDateTime dataContratacao;

    @NotNull
    private Double valor;

}
