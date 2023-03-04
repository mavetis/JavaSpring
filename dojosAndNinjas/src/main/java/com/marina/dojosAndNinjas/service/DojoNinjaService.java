package com.marina.dojosAndNinjas.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.dojosAndNinjas.models.Dojo;
import com.marina.dojosAndNinjas.models.Ninja;
import com.marina.dojosAndNinjas.repositories.DojoRepo;
import com.marina.dojosAndNinjas.repositories.NinjaRepo;

@Service
public class DojoNinjaService {
	private final DojoRepo dojoRepo;
	private final NinjaRepo ninjaRepo;
	
	public DojoNinjaService(DojoRepo dojoRepo, NinjaRepo ninjaRepo) {
		this.dojoRepo=dojoRepo;
		this.ninjaRepo=ninjaRepo;
	}
	
	public void addDojo(Dojo dojo) {
		dojoRepo.save(dojo);
	}
	
	public List<Dojo>getAllDojos(){
		return dojoRepo.findAll();
	}
	
	public Dojo singleDojo(Long id) {
		Optional<Dojo> dojo = dojoRepo.findById(id);
		if(dojo.isPresent()) {
			return dojo.get();
		}
		else {
			return null;
		}
	}
	
	public void addNinja(Ninja ninja) {
		ninjaRepo.save(ninja);
	}
	
	public List<Ninja>getAllNinjas(){
		return ninjaRepo.findAll();
	}
	
	public Ninja singleNinja(Long id) {
		Optional<Ninja> ninja = ninjaRepo.findById(id);
		if(ninja.isPresent()) {
			return ninja.get();
		}
		else {
			return null;
		}
	}
}
