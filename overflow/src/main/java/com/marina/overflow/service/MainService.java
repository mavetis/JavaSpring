package com.marina.overflow.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.marina.overflow.models.Answer;
import com.marina.overflow.models.NewQuestion;
import com.marina.overflow.models.Question;
import com.marina.overflow.models.QuestionTag;
import com.marina.overflow.models.Tag;
import com.marina.overflow.repo.AnswerRepo;
import com.marina.overflow.repo.QuestionRepo;
import com.marina.overflow.repo.TagRepo;

@Service
public class MainService {

	private final QuestionRepo qR;
	private final AnswerRepo aR;
	private final TagRepo tR;
	
	public MainService(QuestionRepo qR, AnswerRepo aR, TagRepo tR) {
		this.qR=qR;
		this.aR=aR;
		this.tR=tR;
	}
	
	public void createQuestion(NewQuestion question) {
		// TODO: make a real question here
		List<Tag> questionsTags = new ArrayList<Tag>();
		for(String subject: question.splitTags()) {
			Tag tag = this.tR.findBySubject(subject).orElse(null);
			if(tag == null) {
				tag = new Tag(subject);
				this.tR.save(tag);
			}
			// prevent dupe tags
			if(!questionsTags.contains(tag))
				questionsTags.add(tag);
		}
		Question newQuestion = new Question(question.getQuestion(), questionsTags);
		this.qR.save(newQuestion);
	}
	public List<Question> getAllQuestion(){
		return this.qR.findAll();
	}
	public Question getQuestion(Long id){
		return this.qR.findById(id).orElse(null);
	}
	public Answer createAnswer(Answer answer) {
		return this.aR.save(answer);
	}
	
}
