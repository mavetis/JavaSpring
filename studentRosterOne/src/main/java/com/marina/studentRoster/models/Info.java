package com.marina.studentRoster.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;



@Entity
@Table(name="infos")
public class Info {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long infoId;
	
	@NotNull
	private String address;
	
	@NotNull
	private String city;
	
	@NotNull
	private String State; 
	
	@Column(updatable=false)
	private Date createdAt;
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
		this.updatedAt= new Date();
	}
	
	public Info() {
		
	}
	
	public Info(Long infoId, String address, String city, String state,Student student) {
		this.infoId=infoId;
		this.address=address;
		this.city=city;
		this.State=state;
		this.student=student;
	}

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
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
		return State;
	}

	public void setState(String state) {
		State = state;
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
