package com.uverwolf.lenguajes.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.uverwolf.lenguajes.models.Lenguaje;

public interface LenguajeRepository extends CrudRepository<Lenguaje, Long>{
	List<Lenguaje> findAll();
	List<Lenguaje> findByCreador(String creador);

}
