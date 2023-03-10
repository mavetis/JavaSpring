package com.marina.of.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.of.models.Question;

@Repository
public interface QuestionRepo extends CrudRepository<Question, Long> {
	List<Question>findAll();
}
