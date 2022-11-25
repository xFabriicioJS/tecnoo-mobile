package com.tecnoo.helpdesk.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tecnoo.helpdesk.Models.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long>{
    
}
