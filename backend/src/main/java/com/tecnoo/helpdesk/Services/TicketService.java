package com.tecnoo.helpdesk.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Ticket;
import com.tecnoo.helpdesk.Models.Dtos.TicketDTO;
import com.tecnoo.helpdesk.Models.Enums.Status;
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


    public List<Ticket> findAllByCliente(Long id){
        return repository.findByClienteId(id);
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

    //Embora o nome do método seja delete, ele irá apenas alterar o status do chamado para cancelado
    public void deleteById(Long id){
        //Verificamos primeiramentoe se existe um chamado com o id que foi nos passado por parametro
        //O próprio método findById já verifica se existe um chamado, e caso não exista, lançará uma exceção.

        Ticket ticketAserCancelado = findById(id);
        if(ticketAserCancelado != null){
            ticketAserCancelado.setStatus(Status.CANCELADO);
            repository.saveAndFlush(ticketAserCancelado);
        }
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
