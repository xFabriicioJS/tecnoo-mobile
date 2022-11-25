package com.tecnoo.helpdesk.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecnoo.helpdesk.Models.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long>{

    @Query("SELECT obj FROM tbclientes WHERE obj.cpf = :cpf")
    Cliente findByCpf(@Param("cpf") String cpf);

    @Query("SELECT obj FROM tbclientes WHERE obj.email = :email")
    Cliente findByEmail(@Param("email") String email);
}
