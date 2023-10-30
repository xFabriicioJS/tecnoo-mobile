package com.tecnoo.helpdesk.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.HistoricoChamado;

@Repository
public interface HistoricoRepository extends JpaRepository<HistoricoChamado, Long>
{

    @Query(value = "SELECT * FROM tbhistorico WHERE id_chamado = :ticketId", nativeQuery = true)
    List<HistoricoChamado> findAllByTicketId(@Param("ticketId") Long id);
}
