package com.tecnoo.helpdesk.Models;

import javax.persistence.*;

import com.tecnoo.helpdesk.Models.Enums.ENivel;

import lombok.Data;

@Entity
@Table(name = "niveis")
@Data
public class Nivel {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private ENivel nome;

    
    
}
