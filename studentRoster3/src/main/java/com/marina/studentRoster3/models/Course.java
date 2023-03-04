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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="courses")
public class Course {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;

@NotNull
private String name;

@Column(updatable=false)
@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date createdAt;

@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
private Date updatedAt;

@ManyToMany(fetch=FetchType.LAZY)
@JoinTable(
			name="students_courses",
			joinColumns = @JoinColumn(name="course_id"),
			inverseJoinColumns = @JoinColumn(name="student_id")
		)
	private List<Student>students;
@PrePersist
protected void onCreate() {
	this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate() {
	this.updatedAt = new Date();
}

public Course() {
	
}

//public Course(Long id, String name, Date createdAt, Date updatedAt, List<Student> students) {
//	this.id=id;
//	this.name=name;
//	this.createdAt=createdAt;
//	this.updatedAt=updatedAt;
//	this.students=students; 
//}
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
public List<Student> getStudents() {
	return students;
}
public void setStudents(List<Student> students) {
	this.students = students;
}

}
