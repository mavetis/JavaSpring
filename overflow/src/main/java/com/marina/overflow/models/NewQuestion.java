package com.marina.overflow.models;

import javax.validation.constraints.NotNull;

public class NewQuestion {

	@NotNull(message="Question cannot be blank")
	private String question;
	
	@NotNull(message="Tags cannot be empty")
	private String tags;
	public String getQuestion() {
		return question;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String[] splitTags() {
		return this.tags.split("\\s*,\\s*");
	}
}
