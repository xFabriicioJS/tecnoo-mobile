package com.tecnoo.helpdesk.Models;

import javax.persistence.*;

import com.tecnoo.helpdesk.Models.Enums.ENivel;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "niveis")
@Data
@NoArgsConstructor
public class Nivel {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private ENivel nome;


    
    
}
