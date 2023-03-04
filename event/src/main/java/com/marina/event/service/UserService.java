package com.marina.event.service;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marina.event.models.Event;
import com.marina.event.models.Message;
import com.marina.event.models.User;
import com.marina.event.repo.EventRepo;
import com.marina.event.repo.MessageRepo;
import com.marina.event.repo.UserRepo;

@Service
public class UserService {
	@Autowired
    private UserRepo userRepo;
	@Autowired
    private EventRepo eventRepo;
	@Autowired
    private MessageRepo messageRepo;
	

    
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    public void deleteEvent(Long id) {
    	eventRepo.deleteById(id);
    }

	public Object findAllEventsInUserState(User user) {
		return eventRepo.findUserStateEvents(user.getState());
		
	}

	public void createEvent(Event event) {
		eventRepo.save(event);
		
	}

	public Object findAllEventsOutUserState(User user) {
		return eventRepo.findUserOutStateEvents(user.getState());
	}

	public Event findEventById(Long id) {
		return eventRepo.findById(id).get();
	}

	public void createMessage(Message message) {
		messageRepo.save(message);
		
	}



	public List<Event> findJoinedEventsByUserId(Long id) {
		return userRepo.findById(id).get().getEvents();
	}
    
}
