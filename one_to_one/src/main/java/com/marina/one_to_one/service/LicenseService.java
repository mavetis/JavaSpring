package com.marina.one_to_one.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.one_to_one.models.License;
import com.marina.one_to_one.repositories.LicenseRepository;

@Service
public class LicenseService {
	private final LicenseRepository licenseRepository;

	public static int licenseNumber;
	
	public LicenseService(LicenseRepository licenseRepository) {
		this.licenseRepository = licenseRepository;
	}
	public License addLicense(License license) {
		return licenseRepository.save(license);
	}
	public List<License> allLicense(){
		return licenseRepository.findAll();
	}
	
	public Optional<License> getLicense(Long lId) {
		return licenseRepository.findById(lId);
	}
	public String stringLicenseNumber(int num) {
		String format = String.format("%06d", num);
		return format;
	}
	
	public String generateLicenseNumber() {
		if(licenseRepository.findTopByOrderByNumberDesc().isEmpty()) {
			licenseNumber +=1;
			return stringLicenseNumber(licenseNumber);
		}
		else {
			List<License> top = licenseRepository.findTopByOrderByNumberDesc() ;
			licenseNumber = 1+(Integer.parseInt(top.get(0).getNumber()));
			return stringLicenseNumber(licenseNumber);
		}
	}

	

	public static int getLicenseNumber() {
		return licenseNumber;
	}

	public static void setLicenseNumber(int licenseNumber) {
		LicenseService.licenseNumber = licenseNumber;
	}


}
