package com.farata.example.dto;

import java.io.Serializable;

import com.farata.dto2extjs.annotations.JSClass;
import com.farata.dto2extjs.annotations.JSManyToOne;

@JSClass
public class AssociateDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	//mandatory attributes:
	public Integer id;
	public String associateName;
	public Integer companyId;
	
	//many-to-one reference:
	@JSManyToOne(foreignKey="companyId")
	public CompanyDTO company;
}
