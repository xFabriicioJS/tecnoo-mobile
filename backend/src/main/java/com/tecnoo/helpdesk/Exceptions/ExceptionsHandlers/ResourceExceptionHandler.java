package com.tecnoo.helpdesk.Exceptions.ExceptionsHandlers;

/*
Classe responsável por interceptar as exceções que podem ser geradas e apresentá-las de forma amigável para o usuário
*/

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Exceptions.StandardError;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ResourceExceptionHandler {

    //Manipulador da exceção ResourceNotFound (exceção personalizada)
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<StandardError> objectNotFound(){

    }
}
