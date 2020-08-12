package com.uverwolf.lenguajes.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uverwolf.lenguajes.models.Lenguaje;
import com.uverwolf.lenguajes.services.LenguajeServices;

@Controller
public class LenguajeController {
	private final LenguajeServices lengService;
	public LenguajeController(LenguajeServices lengService) {
		this.lengService = lengService;
	}
	//LISTADO LENGUAJES
	@GetMapping("/lenguajes")
	public String index(Model modelo){
			List<Lenguaje> lenguajes = lengService.todosLenguajes();
			modelo.addAttribute("lenguajes", lenguajes);
			return "lenguajes/index.jsp";
			
	}
	//VER LENGUAJE ESPECIFICO
	@GetMapping("/lenguajes/{id}")
	public String ver(@PathVariable("id") Long id, Model modelo) {
		Lenguaje leng = lengService.buscar(id);
		modelo.addAttribute("lenguaje", leng);
		return "/lenguajes/ver.jsp";
	}
	//VISTA CREAR
	@RequestMapping("lenguajes/new")
	public String nuevoLenguaje(@ModelAttribute("lenguajeModelo")Lenguaje leng) {
		return "lenguajes/new.jsp";
	}
	//CREACION BASEDATOS
	@PostMapping("/lenguajes")
	public String crear(@Valid @ModelAttribute("lenguajeModelo") Lenguaje leng, BindingResult resultado) {
		if(resultado.hasErrors()) {
			return("/lenguajes/new.jsp");
		}else {
		 lengService.agregar(leng);
		 return("redirect:/lenguajes");
		}
	}
	// VISTA ACTUALIZAR
	@RequestMapping("/lenguajes/{id}/editar")
	public String vistaActualizar(@PathVariable("id")Long id,Model modelo) {
		Lenguaje leng = lengService.buscar(id);
		modelo.addAttribute("lenguajeEditable", leng);
		return "/lenguajes/editar.jsp";
	}
	
	//ACTUALIZAR
	@PutMapping("/lenguajes/{id}")
	public String actualizar(@Valid @ModelAttribute("lengActu") Lenguaje leng,BindingResult resultado) {
		if(resultado.hasErrors()) {
			return "/lenguajes/editar,jsp";
		}else {
			lengService.actualizar(leng);
			
			return "redirect:/lenguajes";
		}
	}
	
	//ELIMINAR
	@RequestMapping (value="/lenguajes/{id}",method = RequestMethod.DELETE)
	public String eliminar (@PathVariable("id") Long id) {
		lengService.eliminarLenguaje(id);
		return "redirect:/lenguajes";
	}
	
	
}
