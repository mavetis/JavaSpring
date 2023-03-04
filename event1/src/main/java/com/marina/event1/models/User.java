package com.marina.event1.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Size(min=3,message="Name must be more than 2 characters!")
    private String firstName;
    @Size(min=2,message="Name must be more than 1 character!")
    private String lastName;
    @Email(message="Email must be valid")
    private String email;
    @Size(min=4,message="City must be more than 3 characters!")
    private String city;
    @Size(min=2,message="State must be 2 characters!")
    private String state;
    @Size(min=5, message="Password must be greater than 5 characters")
    private String password;
    @Transient
    private String passwordConfirmation;
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @OneToMany(mappedBy="user", fetch=FetchType.LAZY)
    private List<Message> messages;
    
    @OneToMany(mappedBy="host", fetch = FetchType.LAZY)
    private List<Event> hosted_events;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_events", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    private List<Event> attending_events;
    
    public User() {
    	
    }
    
    public User(Long id, String firstName, String lastName, String email, String city, String state, 
    			String password, String passwordConfirmation, Date createdAt, Date updatedAt, List<Message>messages, 
    			List<Event>hosted_events, List<Event>attending_events) {
    	super();
    	this.id=id;
    	this.firstName=firstName;
    	this.lastName=lastName;
    	this.email=email;
    	this.city=city;
    	this.state=state;
    	this.password=password;
    	this.passwordConfirmation=passwordConfirmation;
    	this.createdAt=createdAt;
    	this.updatedAt=updatedAt;
    	this.messages=messages;
    	this.hosted_events=hosted_events;
    	this.attending_events=attending_events;
    	
    }
	@PrePersist
	protected void onCreate(){
		this.createdAt = new Date();
	}
	
	@PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public List<Event> getHosted_events() {
		return hosted_events;
	}

	public void setHosted_events(List<Event> hosted_events) {
		this.hosted_events = hosted_events;
	}

	public List<Event> getAttending_events() {
		return attending_events;
	}

	public void setAttending_events(List<Event> attending_events) {
		this.attending_events = attending_events;
	}
	
}


