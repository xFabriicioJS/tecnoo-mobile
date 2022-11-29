package com.tecnoo.helpdesk.Security.Usuario.Jwt;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.tecnoo.helpdesk.Security.Usuario.Services.UsuarioDetailsImpl;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;

// Classe auxiliar para ajudar com:
// Gerar um JWT do usuário, com data, expiração e secret
// Pegar o login de usuário que veio na requisição
//Validar o JWT

@Component
public class JwtUtils {
    private static final Logger logger = LoggerFactory.getLogger(JwtUtils.class);

    @Value("${bezkoder.app.jwtSecret}")
    private String jwtSecret;

    @Value("${bezkoder.app.jwtExpirationMs}")
	private int jwtExpirationMs;

    //Método que gera um novo token
    public String generateJwtToken(Authentication authentication) {

		UsuarioDetailsImpl userPrincipal = (UsuarioDetailsImpl) authentication.getPrincipal();

		return Jwts.builder()
				.setSubject((userPrincipal.getUsername()))
				.setIssuedAt(new Date())
				.setExpiration(new Date((new Date()).getTime() + jwtExpirationMs))
				.signWith(SignatureAlgorithm.HS512, jwtSecret)
				.compact();
	}

    //Pega o username do token jwt
    public String getUserNameFromJwtToken(String token) {
		return Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody().getSubject();
	}

    //valida o token
    public boolean validateJwtToken(String authToken) {
		try {
			Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(authToken);
			return true;
		} catch (SignatureException e) {
			logger.error("Assinatura inválida do token {}", e.getMessage());
		} catch (MalformedJwtException e) {
			logger.error("Token inválido {}", e.getMessage());
		} catch (ExpiredJwtException e) {
			logger.error("Token já expirou: {}", e.getMessage());
		} catch (UnsupportedJwtException e) {
			logger.error("Token JWT não é mais suportado: {}", e.getMessage());
		} catch (IllegalArgumentException e) {
			logger.error("Parece que o Token JWT está vazio: {}", e.getMessage());
		}

		return false;
	}
    


}
