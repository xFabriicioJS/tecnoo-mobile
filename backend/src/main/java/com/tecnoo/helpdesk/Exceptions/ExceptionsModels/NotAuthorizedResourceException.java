package com.tecnoo.helpdesk.Exceptions.ExceptionsModels;

public class NotAuthorizedResourceException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public NotAuthorizedResourceException(String msg) {
        super(msg);
    }
}
