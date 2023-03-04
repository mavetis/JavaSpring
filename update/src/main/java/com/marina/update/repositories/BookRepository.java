package com.marina.update.repositories;

import com.marina.update.models.Book;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	  // this method retrieves all the books from the database
    List<Book> findAll();
    // this method find a book by their description
    List<Book> findByDescriptionContaining(String search);
    // this method counts how many titles contain a certain string
    Optional<Book> findById(Long id);
	void deleteById(Long id);
    Long countByTitleContaining(String search);
    // this method deletes a book that starts with a specific title
    Long deleteByTitleStartingWith(String search);
}
