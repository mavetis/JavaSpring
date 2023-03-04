package com.marina.studentRosterII.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRosterII.models.Dormitory;

@Repository
public interface DormRepo extends CrudRepository<Dormitory, Long> {
	List<Dormitory> findAll();
}
