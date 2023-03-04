package com.marina.studentRoster3.models;

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
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="contacts")
public class Contact {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

@NotNull(message="address must not be empty")
private String address;

@NotNull(message="city must not be empty")
private String city;

@NotNull(message="state must not be empty")
private String state; 

@Column(updatable=false)
@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date createdAt;

@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date updatedAt;

@OneToOne(fetch=FetchType.LAZY)
@JoinColumn(name="student_id")
private Student student;

@PrePersist
protected void onCreate() {
	this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate() {
	this.updatedAt = new Date();
}

public Contact() {
}

public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
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
public Student getStudent() {
	return student;
}
public void setStudent(Student student) {
	this.student = student;
}




}
