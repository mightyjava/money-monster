package com.mightyjava.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mightyjava.model.Money;
import com.mightyjava.model.Source;
import com.mightyjava.repository.MoneyRepository;
import com.mightyjava.repository.SourceRepository;
import com.mightyjava.service.MoneyService;

@Service
public class MoneyServiceImpl implements MoneyService {

	@Autowired
	private MoneyRepository moneyRepository;
	
	@Autowired
	private SourceRepository sourceRepository;

	@Override
	public Page<Money> findAll(Pageable pageable) {
		return moneyRepository.findAll(new PageRequest(pageable.getPageNumber() - 1, 12, Direction.DESC, "date"));
	}

	@Override
	public Money findOne(Long id) {
		return moneyRepository.findOne(id); 
	}

	@Override
	public String addMoney(Money money) {
		String message = null;
		JSONObject jsonObject = new JSONObject();
		try {
			if(money.getId() == null) {
				message = "Added";
			} else {
				message = "Updated";
			}
			money.setSource(sourceRepository.findOne(money.getSourceId()));
			jsonObject.put("status", "success");
			jsonObject.put("title", message+" Confirmation");
			jsonObject.put("message", moneyRepository.save(money).getAmount()+" "+message+" successfully.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	public String deleteMoney(Long id) {
		JSONObject jsonObject = new JSONObject();
		try {
			moneyRepository.delete(id);
			jsonObject.put("message", "Money Deleted Successfully.");
		} catch (JSONException e) {
			e.printStackTrace();	
		}
		return jsonObject.toString();
	}

	@Override
	public List<Source> fetchSources(String type) {
		return sourceRepository.findByType(type);
	}

	@Override
	public String calculate(String type) {
		return moneyRepository.calculate(type);
	}

	@Override
	public List<?> calculateGroupBy(String type) {
		return moneyRepository.calculateGroupBy(type);
	}

	@Override
	public List<?> yearWiseEarnings() {
		return moneyRepository.yearWiseEarnings();
	}

	@Override
	public List<?> yearlyEarning(Integer year) {
		return moneyRepository.yearlyEarning(year);
	}

	@Override
	public Page<?> distributionBySource(Long sourceId, Pageable pageable) {
		return moneyRepository.distributionBySource(sourceRepository.findOne(sourceId), new PageRequest(pageable.getPageNumber() - 1, 12));
	}
	
	@Override
	public Long distributionBySourceSum(Long sourceId) {
		return moneyRepository.distributionBySourceSum(sourceRepository.findOne(sourceId));
	}

	@Override
	public Page<Source> findAllSources(Pageable pageable) {
		return sourceRepository.findAll(new PageRequest(pageable.getPageNumber() - 1, 12, Direction.DESC, "date"));
	}

	@Override
	public Source findOneSource(Long id) {
		return sourceRepository.findOne(id); 
	}

	@Override
	public String addSource(Source source) {
		String message = null;
		JSONObject jsonObject = new JSONObject();
		try {
			if(source.getId() == null) {
				message = "Added";
			} else {
				message = "Updated";
			}
			source.setDate(new Date());
			jsonObject.put("status", "success");
			jsonObject.put("title", message+" Confirmation");
			jsonObject.put("message", sourceRepository.save(source).getName()+" "+message+" successfully.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	@Override
	public List<Source> readExcel(MultipartFile file) {
		List<Source> sources = null;
		try {
			@SuppressWarnings("resource")
			Sheet sheet = new XSSFWorkbook(file.getInputStream()).getSheetAt(0);
			if(sheet != null) {
				sources = new ArrayList<Source>();
				for (Row row : sheet) {
					if(row.getRowNum() == 0){
						continue; 
					} 
					Source source = new Source();
					for (Cell cell : row) {
						if(cell.getColumnIndex() == 0) {
							source.setType(cell.getStringCellValue());
						} 
						if(cell.getColumnIndex() == 1) {
							source.setName(cell.getStringCellValue());
						}
					}
					sources.add(source);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sources;
	}

}