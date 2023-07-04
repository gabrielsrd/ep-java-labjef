package com.example.demo;

public class Pessoa {

    private Integer id;
    private String nusp;
    private String nome;

    public Pessoa() {
        this.id = -1;
    }

    public Pessoa(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNusp() {
        return this.nusp;
    }

    public void setNusp(String content) {
        this.nusp = content;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }


}