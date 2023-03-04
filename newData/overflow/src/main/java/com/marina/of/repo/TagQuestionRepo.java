package com.marina.of.repo;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.of.models.TagQuestion;

@Repository
public interface TagQuestionRepo extends CrudRepository<TagQuestion, Long> {
}
