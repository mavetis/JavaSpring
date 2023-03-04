package com.marina.studentRoster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.studentRoster.models.Info;
import com.marina.studentRoster.repositories.InfoRepo;

@Service
public class InfoService {
	private final InfoRepo infoRepo;
	
	public InfoService(InfoRepo infoRepo) {
		this.infoRepo=infoRepo;
	}
	
	public List<Info> allInfo(){
		return infoRepo.findAll();
	}
	
	public Info addInfo(Info info) {
		return infoRepo.save(info);
	}
	
//	public Info getInfo(Long infoId) {
//		Optional<Info>info = infoRepo.findById(infoId);
//		if(info.isPresent()) {
//			System.out.println(info.get());
//			return info.get();
//		}else {
//			return null;
//		}
//	}
	public Optional<Info>getInfo(Long infoId){
		return infoRepo.findById(infoId);
	}
}
