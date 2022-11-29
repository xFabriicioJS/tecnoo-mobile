package com.tecnoo.helpdesk.Controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Models.Dtos.UsuarioDTO;
import com.tecnoo.helpdesk.Services.UsuarioService;

@RestController
@RequestMapping(value = "/usuarios")
public class UsuarioController {
    
    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    public ResponseEntity<List<UsuarioDTO>> findAll(){
        List<UsuarioDTO> listaUsuarios = usuarioService.findAll().stream().map(usuario -> new UsuarioDTO(usuario)).collect(Collectors.toList());

        return ResponseEntity.ok().body(listaUsuarios);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<UsuarioDTO> findById(@PathVariable Long id){
        Usuario usuarioAserConvertido = usuarioService.findById(id);

        UsuarioDTO objetoResposta = new UsuarioDTO(usuarioAserConvertido);

        return ResponseEntity.ok().body(objetoResposta);
    }
}
