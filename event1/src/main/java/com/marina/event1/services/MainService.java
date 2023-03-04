package com.marina.event1.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marina.event1.models.Event;
import com.marina.event1.models.Message;
import com.marina.event1.models.User;
import com.marina.event1.models.UserEvent;
import com.marina.event1.repo.EventRepo;
import com.marina.event1.repo.MessageRepo;
import com.marina.event1.repo.UserEventRepo;
import com.marina.event1.repo.UserRepo;

@Service
public class MainService {
@Autowired
private UserRepo userRepo;
@Autowired 
private EventRepo eventRepo;
@Autowired
private MessageRepo messageRepo;
@Autowired
private UserEventRepo userEventRepo;

public User registerUser(@Valid User user) {
    String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
    user.setPassword(hashed);
    return userRepo.save(user);
}

public boolean authenticateUser(String email, String password) {
    User user = userRepo.findByEmail(email);
    if(user == null) {
        return false;
    } else {
        if(BCrypt.checkpw(password, user.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

}
public User findByEmail(String email) {
    return userRepo.findByEmail(email);
}

public User findUserById(Long user_id) {
	Optional<User> optionalUser = userRepo.findById(user_id);
	if (optionalUser.isPresent()) {
		return optionalUser.get();
	}else {
	return null;
	}
	}

public List<Event> eventsInState(String state) {
	return eventRepo.findByState(state);
}


public List<Event> eventsOutOfState(String state) {
	return eventRepo.findByStateIsNot(state);
}

public List <Event>allEvents(){
	return (List<Event>) eventRepo.findAll(); 
}

public Event findEventById(Long event_id) {
	return eventRepo.findEventById(event_id);
}
public Event createEvent(Event event) {
	return eventRepo.save(event);
	
}

public UserEvent createRelationship(UserEvent userEvent) {
	return userEventRepo.save(userEvent);
	
}

public void deleteEvent(Long event_id) {
	eventRepo.deleteById(event_id);
}

public Event updateEvent(Event event) {
	return this.eventRepo.save(event);
	
}

public void updateUser(User attendee) {
	userRepo.save(attendee);
	
}
public Message createMessage(Message message) {
	return messageRepo.save(message);
}

public Message updateMessage(Message message) {
	return messageRepo.save(message);
}


}
