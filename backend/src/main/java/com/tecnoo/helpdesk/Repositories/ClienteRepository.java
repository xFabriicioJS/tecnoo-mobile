package com.tecnoo.helpdesk.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Cliente;


@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long>{


    Cliente findByCpf(String cpf);


    Cliente findByEmail(String email);
}
