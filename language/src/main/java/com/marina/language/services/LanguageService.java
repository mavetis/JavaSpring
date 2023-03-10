package com.marina.language.services;

import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;

import com.marina.language.models.Language;
import com.marina.language.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	//dependency injection
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository=languageRepository;
	}
	
	public List<Language> allLanguages(){
		return languageRepository.findAll();
	}
	
	  public Language findLanguage(Long id) {
	        Optional<Language> optionalLanguage = languageRepository.findById(id);
	        if(optionalLanguage.isPresent()) {
	            return optionalLanguage.get();
	        }
	        else {
	            return null;
	        }
	    }
	    
	    public Language addLanguage(Language l) {
	    	return languageRepository.save(l);
	    }
	    
	    public void updateLanguage(Language lang) {
	    	languageRepository.save(lang);
	    }
	    public void deleteLanguage(Long id) {
	    	languageRepository.deleteById(id);
	    }

}
