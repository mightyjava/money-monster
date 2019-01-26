package com.mightyjava.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mightyjava.model.Source;

@Repository
public interface SourceRepository extends PagingAndSortingRepository<Source, Long> {
	
	@Query("FROM Source s WHERE s.type=:type and s.activeStatus=true ORDER BY s.name")
	List<Source> findByType(@Param("type") String type);
}
