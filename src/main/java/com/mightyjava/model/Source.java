package com.mightyjava.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Source extends AbstractPersistable<Long> {
	private static final long serialVersionUID = -6642856254935636758L;
	@NotNull
	private String type;
	@NotNull
	private String name;
	@NotNull
	private Boolean activeStatus;
	
	private Date date;
	
	@OneToMany(targetEntity = Money.class, mappedBy = "source", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Money> moneys;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(Boolean activeStatus) {
		this.activeStatus = activeStatus;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
