package com.tecnoo.helpdesk.Repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long>{


	Usuario findByEmail(String emailUsuario);
	Boolean existsByLoginUsuario(String loginUsuario);

	Boolean existsByEmail(String email);

	Optional<Usuario> findByLoginUsuario(String loginUsuario);

	@Query("SELECT obj FROM Usuario obj WHERE obj.loginUsuario =:loginUsuario")
	Usuario findByUsername(@Param("loginUsuario") String loginUsuario);
}
