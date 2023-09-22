package com.tecnoo.helpdesk.Exceptions;

import lombok.AllArgsConstructor;

//Classe modelo que será apresentada no ResponseEntity do nosso ResourceException Handler

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class StandardError {

    private LocalDateTime timestamp;
    private Integer status;
    private String error;
    private String path;

}
