package com.tecnoo.helpdesk.Exceptions.ExceptionsHandlers;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ForbiddenResourceException;
import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.NotAuthorizedResourceException;

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

    // Manipulador da exceção ResourceNotFound (exceção personalizada)
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<StandardError> objectNotFound() {
        StandardError error = new StandardError(
                java.time.LocalDateTime.now(),
                404,
                "Recurso não encontrado",
                "O recurso que você tentou acessar não foi encontrado");
        return ResponseEntity.status(404).body(error);
    }

    @ExceptionHandler(ForbiddenResourceException.class)
    public ResponseEntity<StandardError> forbiddenResource() {
        StandardError error = new StandardError(
                java.time.LocalDateTime.now(),
                403,
                "Acesso negado",
                "Você não tem permissão para acessar este recurso");

        return ResponseEntity.status(403).body(error);
    }

    @ExceptionHandler(NotAuthorizedResourceException.class)
    public ResponseEntity<StandardError> notAuthorizedResource() {
        StandardError error = new StandardError(
                java.time.LocalDateTime.now(),
                401,
                "Não autorizado",
                "Você não tem autorização para acessar este recurso");

        return ResponseEntity.status(401).body(error);
    }
}
