package com.mightyjava.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mightyjava.model.Money;
import com.mightyjava.model.Source;

@Repository
public interface MoneyRepository extends PagingAndSortingRepository<Money, Long> {
	@Query("SELECT SUM(m.amount) FROM Money m WHERE m.source.type=:type")
	String calculate(@Param("type") String type);

	@Query("SELECT YEAR(m.date), SUM(m.amount) FROM Money m WHERE m.source.type='R' GROUP BY YEAR(m.date)")
	List<?> yearWiseEarnings();
	
	@Query("SELECT m.source.id, m.source.name, SUM(m.amount) FROM Money m WHERE m.source.type=:type GROUP BY m.source.name ORDER BY SUM(m.amount) DESC")
	List<?> calculateGroupBy(@Param("type") String type);
	
	@Query("SELECT m.source.name, SUM(m.amount) FROM Money m WHERE m.source.type='R' AND YEAR(m.date)=:year GROUP by m.source.name ORDER BY SUM(m.amount)")
	List<?> yearlyEarning(@Param("year") Integer year);
	
	@Query("SELECT m.id, m.date, m.moreInformation, m.amount, m.source.activeStatus FROM Money m WHERE m.source=:source ORDER BY m.date DESC")
	Page<?> distributionBySource(@Param("source") Source source, Pageable pageable);
	
	@Query("SELECT SUM(m.amount) FROM Money m WHERE m.source=:source ORDER BY m.date DESC")
	Long distributionBySourceSum(@Param("source") Source source);
}
