class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update]
  def new 
    @company = current_user.build_company
  end

  def create
    @company = current_user.build_company(company_params)
    if @company.save
      flash[:notice] = "Empresa cadastrada com sucesso"
      redirect_to root_path
    else
      flash[:error] = "Erro ao cadastrar a empresa"
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      flash[:notice] = "Empresa atualizada com"
      redirect_to root_path
    else
      flash[:error] = "Erro ao atualizar empresa"
      render :edit
    end
  end

  private

  def set_company
    @company = current_user.company
  end

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
