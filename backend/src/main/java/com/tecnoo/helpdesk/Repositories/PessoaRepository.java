package com.tecnoo.helpdesk.Repositories;

import com.tecnoo.helpdesk.Models.Pessoa;
import com.tecnoo.helpdesk.Models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PessoaRepository extends JpaRepository<Pessoa, Long> {

    Pessoa findByEmail(String emailUsuario);
    Boolean existsByLoginUsuario(String loginUsuario);

    Boolean existsByEmail(String email);

    Optional<Pessoa> findByLoginUsuario(String loginUsuario);

    @Query("SELECT obj FROM Pessoa obj WHERE obj.loginUsuario =:loginUsuario")
    Usuario findByUsername(@Param("loginUsuario") String loginUsuario);
}
