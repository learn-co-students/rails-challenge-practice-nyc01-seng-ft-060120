class CompaniesController < ApplicationController

    def new 
        @company = Company.new 
    end 

    def show 
        @company = Company.find(params[:id])
    end
    
    def create    
        @company = Company.create(name: company_params[:name])    
        @company.offices_attributes=(company_params[:offices_attributes])    
        redirect_to company_path(@company)  
    end

    def company_params    
        params.require(:company).permit(:name, :offices_attributes=>[:id, :offices => []])  
    end
end