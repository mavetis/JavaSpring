package com.marina.event1.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.event1.models.Event;

@Repository
public interface EventRepo extends CrudRepository<Event, Long> {
	List<Event> findByState(String state);

	List<Event> findByStateIsNot(String state);

	Event findEventById(Long event_id);
}
