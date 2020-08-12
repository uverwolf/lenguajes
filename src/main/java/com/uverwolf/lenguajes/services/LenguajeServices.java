package com.uverwolf.lenguajes.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.uverwolf.lenguajes.models.Lenguaje;
import com.uverwolf.lenguajes.repositories.LenguajeRepository;

@Service
public class LenguajeServices {
	private final LenguajeRepository lenguajesCod;
	
	public LenguajeServices(LenguajeRepository lenguajesCod) {
		this.lenguajesCod=lenguajesCod;
	}
	
	public List<Lenguaje> todosLenguajes(){
		return lenguajesCod.findAll();
	}
	public Lenguaje agregar(Lenguaje lengu) {
		return lenguajesCod.save(lengu);
	}
	public Lenguaje buscar(Long id) {
		Optional<Lenguaje> lenguaje= lenguajesCod.findById(id);
		if(lenguaje.isPresent()) {
			return lenguaje.get();
		}else {
			return null;
		}
	}
	public Lenguaje actualizarPostman(Long id, String nombre, String creador, String version) {
		Optional<Lenguaje> leng = lenguajesCod.findById(id);
		if(leng.isPresent()) {
			leng.get().setNombre(nombre);
			leng.get().setCreador(creador);
			leng.get().setVersion(version);
			return lenguajesCod.save(leng.get());
		}else {
			return null;
		}
	}
	public Lenguaje actualizar(Lenguaje leng) {
		Optional<Lenguaje> lenguaje =lenguajesCod.findById(leng.getId());
		if(lenguaje.isPresent()) {
			lenguaje.get().setCreador(leng.getCreador());
			lenguaje.get().setNombre(leng.getNombre());
			lenguaje.get().setVersion(leng.getVersion());
			
			return lenguajesCod.save(lenguaje.get());
		}else {
			return null;
		}
	}

	public void eliminarLenguaje(Long id) {
		 lenguajesCod.deleteById(id);
		
	}
}
