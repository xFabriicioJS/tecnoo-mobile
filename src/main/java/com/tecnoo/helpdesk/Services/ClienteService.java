package com.tecnoo.helpdesk.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Repositories.ClienteRepository;

@Service
public class ClienteService {
    
    @Autowired
    private ClienteRepository repository;

    public Cliente findById(Long id){
        Cliente cliente = repository.findById(id).orElseThrow(()-> new ResourceNotFoundException("Cliente não encontrado"));

        return cliente;
    }

    


}
