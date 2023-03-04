package com.marina.studentRosterII.models;

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
@Table(name="students")
public class Student {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String firstName;
	private String lastName;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="dormitory_id")
    private Dormitory dormitory;
    
    @PrePersist
   	protected void onCreate() {
   		this.createdAt = new Date();
   	}
   	@PreUpdate
   	protected void onUpdate(){
   		this.updatedAt = new Date();
   	}
   	
   	public Student() {
   		
   	}
   	public Student(Long id, String firstName, String lastName, String name, Dormitory dormitory) {
   		this.id=id;
   		this.firstName=firstName;
   		this.lastName=lastName;
   		this.dormitory=dormitory;
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
	public Dormitory getDormitory() {
		return dormitory;
	}
	public void setDormitory(Dormitory dormitory) {
		this.dormitory = dormitory;
	}
}
   	