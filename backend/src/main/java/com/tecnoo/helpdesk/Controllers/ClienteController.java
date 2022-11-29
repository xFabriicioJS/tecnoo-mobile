package com.tecnoo.helpdesk.Controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Dtos.ClienteDTO;
import com.tecnoo.helpdesk.Services.ClienteService;

@CrossOrigin("*")
@RequestMapping(value = "/clientes")
@RestController
public class ClienteController {
    
    @Autowired
    private ClienteService service;

    @GetMapping(value = "/{id}")
    public ResponseEntity<ClienteDTO> findById(@PathVariable Long id){
        
        Cliente cliente = service.findById(id);
        ClienteDTO clienteDTO = new ClienteDTO(cliente);

        return ResponseEntity.ok().body(clienteDTO);
    }

    @GetMapping
    public ResponseEntity<List<ClienteDTO>> findAll(){

        List<ClienteDTO> listaClientes = service.findAll().stream().map((cliente) -> new ClienteDTO(cliente)).collect(Collectors.toList());

        return ResponseEntity.ok().body(listaClientes);
    }



}
