package com.marina.studentRoster3.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="dorms")
public class Dorm {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

@NotNull(message="name cannot be empty")
private String name; 

@Column(updatable=false)
@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date createdAt;

@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date updatedAt;

@PrePersist
protected void onCreate() {
	this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate() {
	this.updatedAt = new Date();
}

@OneToMany(mappedBy="dorm", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
private List<Student>students; 

public Dorm() {}

public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
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
public List<Student> getStudent() {
	return students;
}
public void setStudent(List<Student> student) {
	this.students = student;
}



}
