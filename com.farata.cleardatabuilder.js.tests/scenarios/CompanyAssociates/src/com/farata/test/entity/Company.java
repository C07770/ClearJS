package com.farata.test.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the company database table.
 * 
 */
@Entity
@Table(name="company")
public class Company implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	@Column(name="company")
	private String companyName;

	//bi-directional many-to-one association to CompanyAssociate
	@OneToMany(mappedBy="company")
	private Set<CompanyAssociate> companyAssociates;

    public Company() {
    }

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Set<CompanyAssociate> getCompanyAssociates() {
		return this.companyAssociates;
	}

	public void setCompanyAssociates(Set<CompanyAssociate> companyAssociates) {
		this.companyAssociates = companyAssociates;
	}
	
}