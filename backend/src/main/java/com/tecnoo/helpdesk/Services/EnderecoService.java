package com.tecnoo.helpdesk.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Endereco;
import com.tecnoo.helpdesk.Models.Dtos.EnderecoDTO;
import com.tecnoo.helpdesk.Repositories.EnderecoRepository;

@Service
public class EnderecoService {

    @Autowired
    private EnderecoRepository repository;

    public Endereco findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Endereço não encontrado. Id = " + id));
    }

    /*
     * public Endereco findByIdCliente(Long idCliente){
     * return repository.findByClienteId(idCliente);
     * }
     */

    // Método responsável por criar um endereco e associá-lo a um cliente
    public Endereco create(EnderecoDTO enderecoDto) {

        return convertFromDtoAndSave(enderecoDto);

    }

    public Endereco update(EnderecoDTO enderecoDto) {
        findById(enderecoDto.getId());

        return convertFromDtoAndSave(enderecoDto);
    }

    // Método que converte um enderecoDTO em Endereco
    public Endereco convertFromDtoAndSave(EnderecoDTO enderecoDTO) {

        Endereco endereco = new Endereco(enderecoDTO.getCep(), enderecoDTO.getLogradouro(), enderecoDTO.getNumero(),
                enderecoDTO.getComplemento(), enderecoDTO.getBairro(), enderecoDTO.getCidade(),
                enderecoDTO.getEstado());

        return repository.save(endereco);
    }
}
