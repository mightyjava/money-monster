package com.mightyjava.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.mightyjava.model.Money;
import com.mightyjava.model.Source;

public interface MoneyService {
	Page<Money> findAll(Pageable pageable);
	
	Money findOne(Long id);
	
	String addMoney(Money money);
	
	String deleteMoney(Long id);
	
	List<Source> fetchSources(String type);
	
	String calculate(String type);
	
	List<?> calculateGroupBy(String type);
	
	List<?> yearWiseEarnings();
	
	List<?> yearlyEarning(Integer year);
	
	Page<?> distributionBySource(Long sourceId, Pageable pageable);
	
	Long distributionBySourceSum(Long sourceId);
	
	Page<Source> findAllSources(Pageable pageable);
	
	Source findOneSource(Long id);
	
	String addSource(Source source);
	
	List<Source> readExcel(MultipartFile file);
}
