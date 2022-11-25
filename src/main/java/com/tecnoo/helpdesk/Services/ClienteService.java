package com.tecnoo.helpdesk.Services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Dtos.ClienteDTO;
import com.tecnoo.helpdesk.Repositories.ClienteRepository;

@Service
public class ClienteService {
    
    @Autowired
    private ClienteRepository repository;

    public Cliente findById(Long id){
        Optional<Cliente> cliente = repository.findById(id);

        return cliente.orElseThrow(()-> new ResourceNotFoundException("Cliente não encontrado"));
    }


    public List<Cliente> findAll(){
        return repository.findAll();
    }

    public Cliente update(Long id, @Valid ClienteDTO cliente){
        Cliente clienteAserAtualizado = findById(id);


        //Executando algumas verificações para conferir se o CPF e Email passados não são possuidos por outro cliente. 
        if(findByCpf(cliente.getCpf()) != null && findByCpf(cliente.getCpf()).getId() != id){
            throw new DataIntegrityViolationException("Esse CPF já está cadastrado no sistema!");
        }

        if(findByEmail(cliente.getEmail()) != null && findByEmail(cliente.getEmail()).getId() != id){
            throw new DataIntegrityViolationException("Email já cadastrado no sistema!");
        }

        //Caso passe nessas verificações...
        clienteAserAtualizado.setCpf(cliente.getCpf());
        clienteAserAtualizado.setCnpj(cliente.getCnpj());
        clienteAserAtualizado.setNome(cliente.getNome());
        clienteAserAtualizado.setEmail(cliente.getEmail());
        clienteAserAtualizado.setRazaoSocial(cliente.getRazaoSocial());
        clienteAserAtualizado.setTelefone(cliente.getTelefone());
        clienteAserAtualizado.setEndereco(cliente.getEndereco());

        return repository.saveAndFlush(clienteAserAtualizado);
    }

    public Cliente findByCpf(String cpf){
        Cliente cliente = repository.findByCpf(cpf);
        if(cliente != null){
            return cliente;
        }
        return null;
    }

    public Cliente findByEmail(String email){
        Cliente cliente = repository.findByEmail(email);
        if(cliente != null){
            return cliente;

        }

        return null;
    }



}
