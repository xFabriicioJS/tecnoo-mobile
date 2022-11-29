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

import com.tecnoo.helpdesk.Models.Descarte;
import com.tecnoo.helpdesk.Models.Dtos.DescarteDTO;
import com.tecnoo.helpdesk.Services.DescarteService;

@RestController
@RequestMapping(value = "/descartes")
public class DescarteController {
    
    @Autowired
    private DescarteService descarteService;
    
    @GetMapping(value = "/{id}")
    public ResponseEntity<DescarteDTO> findByID(@PathVariable Long id){
        Descarte descarteAserConvertido = descarteService.findById(id);

        DescarteDTO objResposta = new DescarteDTO(descarteAserConvertido);

        return ResponseEntity.ok().body(objResposta);
    }

    @GetMapping
    public ResponseEntity<List<DescarteDTO>> findAll(){
        List<DescarteDTO> listaChamados = descarteService.findAll().stream().map(chamado -> new DescarteDTO(chamado)).collect(Collectors.toList());

        return ResponseEntity.ok().body(listaChamados);
    }

    @PostMapping
    public ResponseEntity<DescarteDTO> create(@Valid @RequestBody DescarteDTO descarteDTO){
        Descarte descarteCriado = descarteService.create(descarteDTO);

        //Devolvendo o ID criado no ResponseEntity
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(descarteCriado.getId()).toUri();

        return ResponseEntity.created(uri).build();
    }

    @PutMapping
    public ResponseEntity<DescarteDTO> update(@Valid @RequestBody DescarteDTO descarteDTO){

        Descarte descarteAtualizadoAserConvertido = descarteService.update(descarteDTO);

        DescarteDTO descarteJaAtualizado = new DescarteDTO(descarteAtualizadoAserConvertido);

        return ResponseEntity.ok().body(descarteJaAtualizado);
    }


    //Embora o nome do método seja "delete", esse método irá apenas cancelar o chamado
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id){
        descarteService.deleteById(id);

        return ResponseEntity.ok().build();
    }

    @GetMapping(value = "/cliente/{id}")
    public ResponseEntity<List<DescarteDTO>> findAllByClienteId(@PathVariable Long id){
        List<DescarteDTO> listaChamados = descarteService.findAllByCliente(id).stream().map(chamado -> new DescarteDTO(chamado)).collect(Collectors.toList());

        return ResponseEntity.ok().body(listaChamados);
    }

}
