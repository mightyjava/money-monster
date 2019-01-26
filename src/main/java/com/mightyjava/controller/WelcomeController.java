package com.mightyjava.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mightyjava.service.MoneyService;

@Controller
public class WelcomeController {
	
	@Autowired
	private MoneyService moneyService;

	@RequestMapping("/")
	public String welcome(Model model) {
		model.addAttribute("revenue", moneyService.calculate("R"));
		model.addAttribute("expenditure", moneyService.calculate("E"));
		model.addAttribute("groupByRevenue", moneyService.calculateGroupBy("R"));
		model.addAttribute("groupByExpenditure", moneyService.calculateGroupBy("E"));
		model.addAttribute("yearWiseEarnings", moneyService.yearWiseEarnings());
		return "welcome";
	}
}
