package com.tecnoo.helpdesk.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Descarte;

@Repository
public interface DescarteRepository extends JpaRepository<Descarte, Long>{
    //Retorna todos os descartes por cliente
    List<Descarte> findByClienteId(Long id);
}
