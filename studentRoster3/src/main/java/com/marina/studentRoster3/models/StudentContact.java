package com.marina.studentRoster3.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="students_contacts")
public class StudentContact {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(updatable=false)
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
	private Date createdAt;
	    
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
	private Date updatedAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="student_id")
	private Student student; 
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="contact_id")
	private Contact contact; 
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	public StudentContact() {}
	
	public StudentContact(Student student, Contact contact) {
		this.student=student;
		this.contact=contact;
	}
	public StudentContact(Long id,Date createdAt, Date updatedAt,Student student, Contact contact ) {
		this.id=id;
		this.createdAt=createdAt;
		this.updatedAt=updatedAt;
		this.student=student;
		this.contact=contact;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
}
