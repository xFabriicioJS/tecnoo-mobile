package com.tecnoo.helpdesk.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Ticket;
import com.tecnoo.helpdesk.Models.Dtos.TicketDTO;
import com.tecnoo.helpdesk.Repositories.ClienteRepository;
import com.tecnoo.helpdesk.Repositories.TicketRepository;

@Service
public class TicketService {
    
    @Autowired
    private TicketRepository repository;

    @Autowired
    private ClienteRepository clienteRepository;

    public Ticket findById(Long id){
        Optional<Ticket> ticket = repository.findById(id);

        return ticket.orElseThrow(()-> new ResourceNotFoundException("Chamado não encontrado. Id = " + id + " Classe: " + Ticket.class.getName()));
    
    }

    public List<Ticket> findAll(){
        return repository.findAll();
    }


    public List<Ticket> findAllByCliente(){
        return repository.findByClienteId();
    }

    public Ticket create(TicketDTO ticketdto){
        Ticket chamadoAserSalvoJaConvertido = convertDTOtoTicket(ticketdto);
        
        return repository.saveAndFlush(chamadoAserSalvoJaConvertido);
    }


   

    //Método que atualiza o ticket(chamado)

    public Ticket update(TicketDTO ticketDTO){
        Ticket ticketAserAtualizado = findById(ticketDTO.getId());

        ticketAserAtualizado.setDataFinalizacao(ticketDTO.getDataFinalizacao());
        ticketAserAtualizado.setDataLimite(ticketDTO.getDataLimite());
        ticketAserAtualizado.setStatus(ticketDTO.getStatus());

        return repository.saveAndFlush(ticketAserAtualizado);
    }


     //Método que converte um ticketDTO em Ticket
     public Ticket convertDTOtoTicket(TicketDTO ticketDto){
        Ticket ticket = new Ticket();

        Cliente cliente = clienteRepository.findById(ticketDto.getIdcliente()).orElseThrow(()-> new ResourceNotFoundException("Cliente não encontrado. Id " + ticketDto.getIdcliente()));

        ticket.setTitulo(ticketDto.getTitulo());
        ticket.setCliente(cliente);
        ticket.setPrioridade(ticketDto.getPrioridade());
        ticket.setDataFinalizacao(ticket.getDataFinalizacao());
        ticket.setTipoAtendimento(ticketDto.getTipoAtendimento());
        ticket.setDescricao(ticketDto.getDescricao());

        return ticket;
    }
}
