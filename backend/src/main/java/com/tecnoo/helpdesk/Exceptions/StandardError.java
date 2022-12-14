package com.tecnoo.helpdesk.Exceptions;

//Classe modelo que será apresentada no ResponseEntity do nosso ResourceException Handler

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class StandardError {

    private LocalDateTime timestamp;
    private Integer status;
    private String error;
    private String path;

}
