package com.marina.studentRoster.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name="students")
public class Student {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long sId;
	
	@NotNull
	@Size(min = 3, max = 50, message="Name not empty")
	private String firstName;
	
	@NotNull
	@Size(min = 3, max = 50, message="Lastname not Empty")
	private String lastName;
	
	@NotNull
	@Size(min = 1, max = 3, message="enter age")
	private String age;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	@OneToOne(mappedBy="student", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Info info;
	
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
	public Student(Long sId, String firstName, String lastName, String age, Info info) {
		this.sId=sId;
		this.firstName=firstName;
		this.lastName=lastName;
		this.age=age;
		this.info=info;
	}
	public Long getsId() {
		return sId;
	}
	public void setsId(Long sId) {
		this.sId = sId;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
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
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	
}
