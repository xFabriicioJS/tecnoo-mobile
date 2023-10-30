package com.tecnoo.helpdesk.Controllers;

import java.net.URI;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.tecnoo.helpdesk.Models.HistoricoChamado;
import com.tecnoo.helpdesk.Models.Usuario;
import com.tecnoo.helpdesk.Models.Dtos.HistoricoChamadoDTO;
import com.tecnoo.helpdesk.Models.Dtos.UsuarioDTO;
import com.tecnoo.helpdesk.Security.Pessoa.Services.UsuarioDetailsImpl;
import com.tecnoo.helpdesk.Services.HistoricoService;
import com.tecnoo.helpdesk.Services.UsuarioService;

@RestController
@RequestMapping("/historico")
public class HistoricoController {

    @Autowired
    private HistoricoService historicoService;

    @Autowired
    private UsuarioService userService;

    @GetMapping(value = "/chamados/{id}")
    public ResponseEntity<List<HistoricoChamadoDTO>> findAllByTicketId(@PathVariable Long id) {
        List<HistoricoChamado> historicos = historicoService.findAllByTicketId(id);

        List<HistoricoChamadoDTO> historicosDTOList = historicos.stream().map((historico) -> new HistoricoChamadoDTO(historico)).collect(Collectors.toList());

        return ResponseEntity.ok().body(historicosDTOList);
    }

    @PostMapping(value = "/chamados")
    @PreAuthorize("hasAnyAuthority('TECNICO', 'SUPERVISOR', 'ADMINISTRADOR')")
    public ResponseEntity<HistoricoChamadoDTO> create(@RequestBody @Valid HistoricoChamadoDTO historicoChamadoDTO) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UsuarioDetailsImpl userAuth = (UsuarioDetailsImpl) authentication.getPrincipal();

        Usuario usuario = userService.findById(userAuth.getId());

        UsuarioDTO usuarioDTO = new UsuarioDTO(usuario);

        historicoChamadoDTO.setUsuario(usuarioDTO);

        HistoricoChamado historicoCriado = historicoService.create(historicoChamadoDTO);

        // Devolvendo o ID criado no ResponseEntity
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(historicoCriado.getId())
                .toUri();

        return ResponseEntity.created(uri).build();
    }
}
