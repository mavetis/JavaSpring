package com.marina.event.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.event.models.Message;

@Repository
public interface MessageRepo extends CrudRepository<Message, Long> {

}
