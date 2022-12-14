package com.tecnoo.helpdesk.Controllers;

import java.net.URI;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.tecnoo.helpdesk.Models.Ticket;
import com.tecnoo.helpdesk.Models.Dtos.TicketDTO;
import com.tecnoo.helpdesk.Services.TicketService;

@RestController
@RequestMapping(value = "/chamados")
public class TicketController {
    
    @Autowired
    private TicketService ticketService;

    @GetMapping(value = "/{id}")
    public ResponseEntity<TicketDTO> findByID(@PathVariable Long id){
        Ticket tikcetAserConvertido = ticketService.findById(id);

        TicketDTO objResposta = new TicketDTO(tikcetAserConvertido);

        return ResponseEntity.ok().body(objResposta);
    }

    @GetMapping
    public ResponseEntity<List<TicketDTO>> findAll(){
        List<TicketDTO> listaChamados = ticketService.findAll().stream().map(chamado -> new TicketDTO(chamado)).collect(Collectors.toList());

        return ResponseEntity.ok().body(listaChamados);
    }

    @PostMapping
    public ResponseEntity<TicketDTO> create(@Valid @RequestBody TicketDTO ticketDTO){
        Ticket ticketCriado = ticketService.create(ticketDTO);

        //Devolvendo o ID criado no ResponseEntity
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(ticketCriado.getId()).toUri();

        return ResponseEntity.created(uri).build();
    }

    @PutMapping
    public ResponseEntity<TicketDTO> update(@Valid @RequestBody TicketDTO ticketDTO){

        Ticket ticketAtualizadoAserConvertido = ticketService.update(ticketDTO);

        TicketDTO ticketJaAtualizado = new TicketDTO(ticketAtualizadoAserConvertido);

        return ResponseEntity.ok().body(ticketJaAtualizado);
    }


    //Embora o nome do m??todo seja "delete", esse m??todo ir?? apenas cancelar o chamado
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id){
        ticketService.deleteById(id);

        return ResponseEntity.ok().build();
    }

    @GetMapping(value = "/cliente/{id}")
    public ResponseEntity<List<TicketDTO>> findAllByClienteId(@PathVariable Long id){
        List<TicketDTO> listaChamados = ticketService.findAllByCliente(id).stream().map(chamado -> new TicketDTO(chamado)).collect(Collectors.toList());

        return ResponseEntity.ok().body(listaChamados);
    }

}
