def model(dbt, session):
	  	products_source=dbt.source("qwt_src","products")
	  	return products_source