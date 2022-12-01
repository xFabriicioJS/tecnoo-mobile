package com.tecnoo.helpdesk.Security.Pessoa.AuthPayload.response;

import com.tecnoo.helpdesk.Models.Dtos.EnderecoDTO;
import com.tecnoo.helpdesk.Models.Plano;

import java.util.List;

public class JwtResponse {
    private String token;
    private String type = "Bearer";
    private Long id;
    private String username;
    private String email;
    private String nome;
    private List<String> roles;


    private String cpf;


    private String telefone;


    private String cnpj;


    private String razaoSocial;

    private Long idTipo;

    private EnderecoDTO endereco;

    private Plano plano;


    //Corpo de resposta que será enviado na resposta do método login do controller AuthController
    //Corpo da resposta caso seja um funcionário (Usuário)
    public JwtResponse(String accessToken, Long id, String username, String email, List<String> roles, String nome) {
      this.token = accessToken;
      this.id = id;
      this.username = username;
      this.email = email;
      this.roles = roles;
      this.nome = nome;
    }


    //Corpo da resposta caso seja um cliente
    public JwtResponse(String token, Long id, String username, String email, String nome,
                       List<String> roles, String cpf, String telefone, String cnpj, String razaoSocial,
                       Long idTipo, EnderecoDTO endereco, Plano plano) {
        this.token = token;
        this.id = id;
        this.username = username;
        this.email = email;
        this.nome = nome;
        this.roles = roles;
        this.cpf = cpf;
        this.telefone = telefone;
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
        this.idTipo = idTipo;
        this.endereco = endereco;
        this.plano = plano;
    }

    public String getAccessToken() {
      return token;
    }
  
    public void setAccessToken(String accessToken) {
      this.token = accessToken;
    }
  
    

    public String getToken() {
      return token;
    }


    public void setToken(String token) {
      this.token = token;
    }


    public String getType() {
      return type;
    }


    public void setType(String type) {
      this.type = type;
    }


    public void setRoles(List<String> roles) {
      this.roles = roles;
    }


    public String getCpf() {
      return cpf;
    }


    public void setCpf(String cpf) {
      this.cpf = cpf;
    }


    public String getTelefone() {
      return telefone;
    }


    public void setTelefone(String telefone) {
      this.telefone = telefone;
    }


    public String getCnpj() {
      return cnpj;
    }


    public void setCnpj(String cnpj) {
      this.cnpj = cnpj;
    }


    public String getRazaoSocial() {
      return razaoSocial;
    }


    public void setRazaoSocial(String razaoSocial) {
      this.razaoSocial = razaoSocial;
    }


    public Long getIdTipo() {
      return idTipo;
    }


    public void setIdTipo(Long idTipo) {
      this.idTipo = idTipo;
    }


    public EnderecoDTO getEndereco() {
      return endereco;
    }


    public void setEndereco(EnderecoDTO endereco) {
      this.endereco = endereco;
    }


    public Plano getPlano() {
      return plano;
    }


    public void setPlano(Plano plano) {
      this.plano = plano;
    }


    public String getTokenType() {
      return type;
    }
  
    public void setTokenType(String tokenType) {
      this.type = tokenType;
    }
  
    public Long getId() {
      return id;
    }
  
    public void setId(Long id) {
      this.id = id;
    }
  
    public String getEmail() {
      return email;
    }
  
    public void setEmail(String email) {
      this.email = email;
    }
  
    public String getUsername() {
      return username;
    }
  
    public void setUsername(String username) {
      this.username = username;
    }
  
    public List<String> getRoles() {
      return roles;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    
    
}
