package com.tecnoo.helpdesk.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Endereco;

@Repository
public interface EnderecoRepository extends JpaRepository<Endereco, Long> {

    Endereco findByClienteId(Long id);
}
