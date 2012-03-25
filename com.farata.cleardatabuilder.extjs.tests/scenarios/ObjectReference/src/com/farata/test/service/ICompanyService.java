package com.farata.test.service;

import java.util.List;

import com.farata.test.entity.Company;
import com.farata.test.entity.CompanyAssociate;

import clear.cdb.extjs.annotations.CX_JSGenerateStore;
import clear.cdb.extjs.annotations.CX_JSGenerateSample;
import clear.cdb.extjs.annotations.CX_JSJPQLMethod;
import clear.cdb.extjs.annotations.CX_JSService; 
import clear.cdb.extjs.annotations.CX_TransferInfo;
import clear.cdb.extjs.annotations.CX_UpdateInfo;

@CX_JSService
public interface ICompanyService {

	@CX_JSGenerateStore 
	@CX_JSGenerateSample
	@CX_JSJPQLMethod(query = "SELECT c FROM Company c", transferInfo=@CX_TransferInfo(type="dto.CompanyDTO", mappedBy = Company.class),
			updateInfo=@CX_UpdateInfo(updateEntity = Company.class, autoSyncEnabled = true))
	List<?> getCompanies();   

	@CX_JSGenerateStore 
	@CX_JSGenerateSample
	@CX_JSJPQLMethod(query = "SELECT a FROM CompanyAssociate a", transferInfo=@CX_TransferInfo(type="dto.AssociateDTO", mappedBy = CompanyAssociate.class),
			updateInfo=@CX_UpdateInfo(updateEntity = CompanyAssociate.class, autoSyncEnabled = true))
	List<?> getAssociates(); 
}
