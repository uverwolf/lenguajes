package com.uverwolf.lenguajes.controllers;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uverwolf.lenguajes.models.Lenguaje;
import com.uverwolf.lenguajes.services.LenguajeServices;
	   

@RestController
public class LenguajeApi {

	private final LenguajeServices lengCod;
	
	public LenguajeApi(LenguajeServices lengCod) {
		super();
		this.lengCod=lengCod;
	}
	
	@RequestMapping("/api/lenguajes")
	public List<Lenguaje> index(){
		return lengCod.todosLenguajes();
	}
	
	@PostMapping("/api/lenguajes")
	public Lenguaje crear(@RequestParam(value="nombre")String nombre,@RequestParam(value="creador")String creador,@RequestParam("version")String version) {
		Lenguaje lenguaje = new Lenguaje(nombre,creador,version);
		return lengCod.agregar(lenguaje);
	}
	
	@GetMapping("/api/lenguajes/{id}")
	
	public Lenguaje verLenguaje(@PathVariable("id")Long id) {
		Lenguaje lenguaje = lengCod.buscar(id);
		return lenguaje;
	}
	@PostMapping("/api/languajes/{id}")
	public Lenguaje actualizarAPI(@PathVariable("id")Long id,@RequestParam(value = "nombre") String nombre,@RequestParam(value="creador") String creador,@RequestParam(value="version")String version) {
		
		return	lengCod.actualizarPostman(id, nombre, creador, version);
		
	}
}
