package com.tecnoo.helpdesk.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.HistoricoChamado;
import com.tecnoo.helpdesk.Models.Ticket;
import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Models.Dtos.HistoricoChamadoDTO;
import com.tecnoo.helpdesk.Repositories.HistoricoRepository;
import com.tecnoo.helpdesk.Repositories.TicketRepository;

@Service
public class HistoricoService {

    @Autowired
    private HistoricoRepository historicoRepository;

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private UsuarioService usuarioService;

    public List<HistoricoChamado> findAllByTicketId(Long id) {
        return historicoRepository.findAllByTicketId(id);
    }

    public HistoricoChamado create(HistoricoChamadoDTO historicoChamado) {
        HistoricoChamado historicoAserSalvo = convertDTOtoHistorico(historicoChamado);

        return historicoRepository.saveAndFlush(historicoAserSalvo);
    }

    private HistoricoChamado convertDTOtoHistorico(HistoricoChamadoDTO historicoChamado) {
        HistoricoChamado historico = new HistoricoChamado();

        Ticket ticket = ticketRepository
        .findById(historicoChamado.getIdChamado())
        .orElseThrow(()-> new ResourceNotFoundException(
        "Chamado não encontrado " + historicoChamado.getIdChamado() ));


        historico.setChamado(ticket);
        historico.setDescricao(historicoChamado.getDescricao());

        return historico;
    }

}