package com.marina.of.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.of.models.Answer;

@Repository
public interface AnswerRepo extends CrudRepository<Answer, Long> {

}
