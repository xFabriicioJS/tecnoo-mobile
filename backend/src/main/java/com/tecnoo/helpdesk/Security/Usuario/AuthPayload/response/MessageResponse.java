package com.tecnoo.helpdesk.Security.Usuario.AuthPayload.response;

//Classe auxiliar que ajuda a nos mandar uma mensagem no ResponseEntity

public class MessageResponse {
    private String message;
  
    public MessageResponse(String message) {
      this.message = message;
    }
  
    public String getMessage() {
      return message;
    }
  
    public void setMessage(String message) {
      this.message = message;
    }
  }