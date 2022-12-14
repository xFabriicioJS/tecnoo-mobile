package com.tecnoo.helpdesk.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecnoo.helpdesk.Exceptions.ExceptionsModels.ResourceNotFoundException;
import com.tecnoo.helpdesk.Models.Cliente;
import com.tecnoo.helpdesk.Models.Descarte;
import com.tecnoo.helpdesk.Models.Dtos.DescarteDTO;
import com.tecnoo.helpdesk.Models.Enums.Status;
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

        return descarte.orElseThrow(()-> new ResourceNotFoundException("Descarte não encontrado. Id = " + id + " Classe: " + Descarte.class.getName()));
    
    }

    public List<Descarte> findAll(){
        return repository.findAll();
    }


    public List<Descarte> findAllByCliente(Long id){
        return repository.findByClienteId(id);
    }

    //Embora o nome do método seja delete, ele irá apenas alterar o status do descarte para cancelado
    public void deleteById(Long id){
        //Verificamos primeiramentoe se existe um descarte com o id que foi nos passado por parametro
        //O próprio método findById já verifica se existe um descarte, e caso não exista, lançará uma exceção.

        Descarte descarteAserCancelado = findById(id);
        if(descarteAserCancelado != null){
            descarteAserCancelado.setStatus(Status.CANCELADO);
            repository.saveAndFlush(descarteAserCancelado);
        }
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

        Cliente cliente = clienteRepository.findById(descarteDto.getIdCliente())
                .orElseThrow(()-> new ResourceNotFoundException("O Cliente desse descarte não foi encontrado. Id "
                        + descarteDto.getIdCliente()));

        descarte.setNomeHardware(descarteDto.getNomeHardware());
        descarte.setCliente(cliente);
        descarte.setDescricao(descarteDto.getDescricao());
        descarte.setPrazo(descarteDto.getPrazo());

        return descarte;
    }


}
