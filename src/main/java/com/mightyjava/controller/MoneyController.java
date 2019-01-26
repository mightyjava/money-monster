package com.mightyjava.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mightyjava.model.Money;
import com.mightyjava.model.Source;
import com.mightyjava.service.MoneyService;
import com.mightyjava.utils.ErrorUtils;
import com.mightyjava.utils.MethodUtils;

@Controller
@RequestMapping("/money")
public class MoneyController {
	
	@Autowired
	private MoneyService moneyService;
	
	
	@GetMapping("/form")
	public String moneyForm(Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("moneyForm", new Money());
		model.addAttribute("incomeTypes", MethodUtils.incomeTypes());
		return "money/entry";
	}
	
	@GetMapping("/list")
	public String list(Model model, Pageable pageable) {
		Page<Money> pages = moneyService.findAll(pageable);
		model.addAttribute("moneyDetails", pages.getContent());
		model.addAttribute("revenue", moneyService.calculate("R"));
		model.addAttribute("expenditure", moneyService.calculate("E"));
		MethodUtils.pageModel(model, pages);
		return "/money/list";
	}
	
	@PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String moneyAdd(@Valid @RequestBody Money money, BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return moneyService.addMoney(money);
		}
	}
	
	@GetMapping("/edit/{id}")
	public String moneyOne(@PathVariable Long id, Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("incomeTypes", MethodUtils.incomeTypes());
		model.addAttribute("moneyForm", moneyService.findOne(id));
		return "money/entry";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String userDelete(@PathVariable Long id) {
		return moneyService.deleteMoney(id);
	}
	
	@GetMapping("/fetch/{type}")
	public String fetchSources(@PathVariable String type, Model model) {
		model.addAttribute("sources", moneyService.fetchSources(type));
		return "/money/sources";
	}
	
	@GetMapping("/yearlyEarning/{year}")
	public String yearlyEarning(@PathVariable Integer year, Model model) {
		model.addAttribute("yearlyEarning", moneyService.yearlyEarning(year));
		return "/money/yearlyEarning";
	}
	
	@GetMapping("/distributionBySource/{sourceId}")
	public String distributionBySource(@PathVariable Long sourceId, Model model, Pageable pageable) {
		Page<?> pages = moneyService.distributionBySource(sourceId, pageable);
		model.addAttribute("distributionBySource", pages.getContent());
		model.addAttribute("distributionBySourceSum", moneyService.distributionBySourceSum(sourceId));
		model.addAttribute("source", moneyService.findOneSource(sourceId));
		MethodUtils.pageModel(model, pages);
		return "/money/distributionBySource";
	}
	
	@GetMapping("/inoutSources/form")
	public String inoutSourcesForm(Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("inoutSourcesForm", new Source());
		model.addAttribute("incomeTypes", MethodUtils.incomeTypes());
		return "money/sourceForm";
	}
	
	@GetMapping("/inoutSources/edit/{id}")
	public String sourceOne(@PathVariable Long id, Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("incomeTypes", MethodUtils.incomeTypes());
		model.addAttribute("inoutSourcesForm", moneyService.findOneSource(id));
		return "money/sourceForm";
	}
	
	@PostMapping(value="/inoutSources/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String sourceAdd(@Valid @RequestBody Source source, BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return moneyService.addSource(source);
		}
	}
	
	@GetMapping("/inoutSources/list")
	public String inoutSourcesList(Model model, Pageable pageable) {
		Page<Source> pages = moneyService.findAllSources(pageable);
		model.addAttribute("sources", pages.getContent());
		MethodUtils.pageModel(model, pages);
		return "/money/inoutSources";
	}
	
	@GetMapping("/downloadTemplate/{templateFor}")
	public ResponseEntity<InputStreamResource> downloadTemplate(@PathVariable String templateFor) throws IOException {
		String fileName = null;
		if(templateFor.equals("source")) {
			fileName = "source_template";
		} else {
			fileName = "money_template";
		}
		File file = new ClassPathResource("xls-templates/"+fileName+".xlsx").getFile();
        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + file.getName())
				.contentType(MediaType.MULTIPART_FORM_DATA).contentLength(file.length()).body(resource);
	}
	
	@GetMapping("/uploadModal/{modalFor}")
	public String uploadModal(@PathVariable String modalFor, Model model) throws IOException {
		model.addAttribute("modalFor", modalFor);
		return "/money/uploadModal";
	}
	
	@PostMapping("/readExcel/{modalFor}")
	public String readExcel(@PathVariable String modalFor, Model model, MultipartFile file) {
		model.addAttribute("modalFor", modalFor);
		model.addAttribute("sources", moneyService.readExcel(file));
	    return "/money/uploadedData";
	}
}
