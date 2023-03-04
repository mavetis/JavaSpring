package com.marina.of.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.of.models.Answer;

@Repository
public interface AnswerRepo extends CrudRepository <Answer, Long> {
	List<Answer>findAll();
	List <Answer> findByQuestionId(Long questionId);
}
