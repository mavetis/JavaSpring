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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="students")
public class Student {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;
@NotNull(message="first name must not be empty")
private String firstName;

@NotNull(message="last name must not be empty")
private String lastName;

@NotNull(message="age must not be empty")
private Integer age; 

@Column(updatable=false)
@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date createdAt;

@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date updatedAt;

@OneToOne(mappedBy="student", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
private Contact contact;


@ManyToOne(fetch=FetchType.LAZY)
@JoinColumn(name="dorm_id")
private Dorm dorm; 

@ManyToMany(fetch = FetchType.LAZY)
@JoinTable(
		name="students_courses",
		joinColumns=@JoinColumn(name="student_id"),
		inverseJoinColumns=@JoinColumn(name="course_id"))
private List<Course>courses;

@PrePersist
protected void onCreate() {
	this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate() {
	this.updatedAt = new Date();
}

public Student() {}

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
public Integer getAge() {
	return age;
}
public void setAge(Integer age) {
	this.age = age;
}
public Date getCreatedAt() {
	return createdAt;
}
public Contact getContact() {
	return contact;
}
public void setContact(Contact contact) {
	this.contact = contact;
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

public Dorm getDorm() {
	return dorm;
}
public void setDorm(Dorm dorm) {
	this.dorm = dorm;
}
public List<Course> getCourses() {
	return courses;
}
public void setCourses(List<Course> courses) {
	this.courses = courses;
}



}
