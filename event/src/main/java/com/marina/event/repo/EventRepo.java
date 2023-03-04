package com.marina.event.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.event.models.Event;

@Repository
public interface EventRepo extends CrudRepository<Event, Long> {
	@Query("SELECT e FROM Event e WHERE state = ?1")
	List<Event> findUserStateEvents(String state);
	
	@Query("SELECT e FROM Event e WHERE state != ?1")
	List<Event> findUserOutStateEvents(String state);
}
