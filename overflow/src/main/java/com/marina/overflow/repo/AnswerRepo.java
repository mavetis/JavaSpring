package com.marina.overflow.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.overflow.models.Answer;

@Repository
public interface AnswerRepo extends CrudRepository<Answer, Long> {

}
