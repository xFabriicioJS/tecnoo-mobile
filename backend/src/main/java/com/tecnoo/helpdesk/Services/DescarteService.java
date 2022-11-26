package com.tecnoo.helpdesk.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Descarte;
import com.tecnoo.helpdesk.Models.Dtos.DescarteDTO;
import com.tecnoo.helpdesk.Repositories.ClienteRepository;
import com.tecnoo.helpdesk.Repositories.DescarteRepository;

@Service
public class DescarteService {

    @Autowired
    private DescarteRepository repository;

    @Autowired
    private ClienteRepository clienteRepository;

    public Descarte findById(Long id){
        Optional<Descarte> descarte = repository.findById(id);

        return descarte.orElseThrow(()-> new ResourceNotFoundException("Chamado não encontrado. Id = " + id + " Classe: " + Descarte.class.getName()));
    
    }

    public List<Descarte> findAll(){
        return repository.findAll();
    }


    public List<Descarte> findAllByCliente(){
        return repository.findByClienteId();
    }

    public Descarte create(DescarteDTO descartedto){
        Descarte descarteAserSalvoJaConvertido = convertDTOtoDescarte(descartedto);
        
        return repository.saveAndFlush(descarteAserSalvoJaConvertido);
    }


   

    //Método que atualiza o descarte

    public Descarte update(DescarteDTO descarteDTO){
        Descarte descarteAserAtualizado = findById(descarteDTO.getId());

        descarteAserAtualizado.setDataRetirada(descarteDTO.getDataRetirada());
        descarteAserAtualizado.setStatus(descarteDTO.getStatus());

        return repository.saveAndFlush(descarteAserAtualizado);
    }


     //Método que converte um descarteDTO em Descarte
     public Descarte convertDTOtoDescarte(DescarteDTO descarteDto){
        Descarte descarte = new Descarte();

        Cliente cliente = clienteRepository.findById(descarteDto.getIdCliente()).orElseThrow(()-> new ResourceNotFoundException("Cliente não encontrado. Id " + descarteDto.getIdCliente()));

        descarte.setNomeHardware(descarteDto.getNomeHardware());
        descarte.setCliente(cliente);
        descarte.setDescricao(descarteDto.getDescricao());
        descarte.setPrazo(descarteDto.getPrazo());

        return descarte;
    }
}
