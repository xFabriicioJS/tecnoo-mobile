package com.tecnoo.helpdesk.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long>{

    @Query("SELECT obj from tbusuarios WHERE obj.loginUsuario = :loginUsuario")
    Usuario findByLoginUsuario(@Param("loginUsuario") String loginUsuario);

    @Query("SELECT obj from tbusuarios WHERE obj.email = :email")
    Usuario findByEmail(@Param("email") String email);
    
}
