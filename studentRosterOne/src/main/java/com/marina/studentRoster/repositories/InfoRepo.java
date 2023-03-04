package com.marina.studentRoster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.marina.studentRoster.models.Info;

public interface InfoRepo extends CrudRepository<Info, Long>{
	List<Info> findAll();
}
