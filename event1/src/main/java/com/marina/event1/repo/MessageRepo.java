package com.marina.event1.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.event1.models.Message;

@Repository
public interface MessageRepo extends CrudRepository<Message, Long> {

}
