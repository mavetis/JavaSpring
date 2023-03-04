package com.marina.studentRoster3.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.studentRoster3.models.Dorm;

@Repository
public interface DormRepo extends CrudRepository<Dorm, Long> {
List <Dorm>findAll();
}
