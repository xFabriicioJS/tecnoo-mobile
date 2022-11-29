package com.tecnoo.helpdesk.Security.Usuario.Jwt;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

//Classe responsável por gerenciar quando um usuário tenta acessar um recurso sem autorização(com token expirado, sem token, etc.)

@Component
public class AuthEntryPointJwt implements AuthenticationEntryPoint {

	private static final Logger logger = LoggerFactory.getLogger(AuthEntryPointJwt.class);

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		logger.error("Erro de autorização: {}", authException.getMessage());


        //Mandará uma resposta 401 (Sem autorização)
		response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "ERRO: Não autorizado.");
	}

}