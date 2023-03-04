package com.marina.of.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.of.models.Answer;
import com.marina.of.models.Question;
import com.marina.of.models.Tag;
import com.marina.of.models.TagQuestion;
import com.marina.of.repo.AnswerRepo;
import com.marina.of.repo.QuestionRepo;
import com.marina.of.repo.TagQuestionRepo;
import com.marina.of.repo.TagRepo;

@Service
public class MainService {
	private final QuestionRepo qR;
	private final AnswerRepo aR;
	private final TagRepo tR;
	private final TagQuestionRepo tQR;
	
	public MainService(QuestionRepo qR, AnswerRepo aR, TagRepo tR, TagQuestionRepo tQR) {
		this.qR=qR;
		this.aR=aR;
		this.tR=tR;
		this.tQR=tQR;
	}
	
//create
	public Question createQ(String question) {
		Question newQ= new Question(question);
		return qR.save(newQ);
	}
	public Answer createAnswer(Answer answer) {
		return aR.save(answer);
	}
	public Tag createTag(String tagz) {
		Optional <Tag>optionalTag = tR.findByTag(tagz);
		if(optionalTag.isPresent()) {
			return optionalTag.get();
		}else {
			Tag newTag = new Tag(tagz);
			return tR.save(newTag);
		}
	}
	public void createQTag(TagQuestion newTQ) {
		tQR.save(newTQ);
	}
	
	
	//find
	public List <Question>allQuestions(){
		return qR.findAll();
	}
	
	public Question findQuestionById(Long questionId) {
		return qR.findQuestionById(questionId);
	}
	
	public List<Answer>findByQuestionId(Long questionId){
		return aR.findByQuestionId(questionId);
	}
}
