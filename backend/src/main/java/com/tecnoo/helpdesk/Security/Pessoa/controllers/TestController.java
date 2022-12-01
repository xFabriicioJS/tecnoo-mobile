package com.tecnoo.helpdesk.Security.Pessoa.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//Controller onde vamos realizar alguns testes para testar os niveis de usuário


@RestController
@RequestMapping("/api/test")
public class TestController {
    
    //Deve ser acessado por qualquer usuário
    @GetMapping("/all")
    public String liberadoAcesso(){
        return "Esse é um recurso disponível para TODOS os usuários.";
    }


    @GetMapping("/tecnico")
    @PreAuthorize("hasAnyAuthority('TECNICO', 'SUPERVISOR', 'ADMINISTRADOR')")
    public String tecnicoAcesso(){
        return "Esse é um recurso disponível para apenas técnicos ou superiores";
    }

    @GetMapping("/supervisor")
    @PreAuthorize("hasAuthority('ADMINISTRADOR') or hasAuthority('SUPERVISOR')")
    public String supervisorAcesso(){
        return "Esse é um recurso disponível para apenas supervisores e administradores";
    }

    @GetMapping("/admin")
    @PreAuthorize("hasAuthority('ADMINISTRADOR')")
    public String adminAcesso(){
        System.out.println();

        return "Esse é um recurso disponível para apenas administradores";
    }


    @GetMapping("/cliente")
    @PreAuthorize("hasAuthority('CLIENTE')")
    public String clienteAcesso(){
        return "Esse é um recurso disponível para apenas clientes";
    }

}
