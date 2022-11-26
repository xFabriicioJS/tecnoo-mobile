package com.tecnoo.helpdesk.Exceptions.ExceptionsModels;

public class ResourceNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ResourceNotFoundException(String msg) {
        super(msg);
    }
}
    

