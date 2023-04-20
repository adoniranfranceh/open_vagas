class PositionsController < ApplicationController
  def index; end
  
  def show; end

  def new; end

  def create; end

  def edit; end

<<<<<<< HEAD
  def update; end
=======
  def update 
    if @position.update(params_position)
      redirect_to positions_path
    else
      render :edit
    end
  end

  private

  def set_position
    @position = @company.positions.find(params[:id])
  end

  def params_position
    params.require(:position).permit(:name, 
      :career, 
      :contract, 
      :remote, 
      :publish, 
      :city, 
      :state,
      :summary,
      :description
      )
  end

  def set_company
    redirect_to new_company_path if current_user.company.nil?
    @company = current_user.company
  end

  def set_i18n_careers
    @careers = I18n.t('activerecord.attributes.position.careers')
  end

  def set_i18n_contracts
    @contracts = I18n.t('activerecord.attributes.position.contracts')
  end
>>>>>>> 35cdb55... creating initial page to see all positions
end
