package com.tecnoo.helpdesk.Repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecnoo.helpdesk.Models.Nivel;
import com.tecnoo.helpdesk.Models.Enums.ENivel;

@Repository
public interface NivelRepository extends JpaRepository<Nivel, Long> {
    
    Optional<Nivel> findByNome(ENivel nome);
    

}
