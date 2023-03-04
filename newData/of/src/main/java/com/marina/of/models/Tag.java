package com.marina.of.models;

import java.util.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
@Entity
@Table(name="tags")
public class Tag {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="subject cant be blank")
	private String subject;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PostPersist
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="tags_questions",
			joinColumns=@JoinColumn(name="tag_id"),
			inverseJoinColumns=@JoinColumn(name="question_id")
			)
		private List<Question>questions;
	
	public Tag() {
		
	}
	public Tag(String subject) {
		this.subject=subject;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	
}
