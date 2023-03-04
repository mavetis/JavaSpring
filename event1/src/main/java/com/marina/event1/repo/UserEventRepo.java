package com.marina.event1.repo;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marina.event1.models.UserEvent;



@Repository
public interface UserEventRepo extends CrudRepository<UserEvent, Long> {
//List<UserEvent> findByEventContains(Event event);
//UserEvent findByEventAndUser(Event event, User user);
}
