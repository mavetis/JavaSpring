package com.marina.one_to_one.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.one_to_one.models.Person;
import com.marina.one_to_one.repositories.PersonRepository;

@Service
public class PersonService {
	private final PersonRepository pRepository;
	
	public PersonService(PersonRepository pRepository) {
		this.pRepository=pRepository;
	}
	
	public List <Person> allPerson(){
		return pRepository.findAll();
	}
	
	public Person addPerson(Person person) {
		return pRepository.save(person);
	}
	
	public Person getPerson(Long perId) {
		Optional <Person> person = pRepository.findById(perId);
		if(person.isPresent()) {
			System.out.println(person.get());
			return person.get();
		} else {
			return null;
		}
		}
	
	public Optional<Person> getPer(Long perId){
		return pRepository.findById(perId);
	}
	
	
}
