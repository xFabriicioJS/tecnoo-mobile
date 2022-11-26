package com.tecnoo.helpdesk.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Ticket;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {

    //Retorna todos os chamados por cliente
    List<Ticket> findByClienteId();
    
}
