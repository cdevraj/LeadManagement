class LeadsController < BaseController

  def new
  	@lead = Lead.new
  end
  
  def create
  	Lead.create(lead_params)
  	redirect_to leads_path
  end	

  def index
    if params[:user_id].present?
      Lead
      @leads = Lead.where(user_id: params[:user_id])
    else
      @leads = current_user.leads
    end  
  end 	

  private
  def lead_params
  	params[:lead][:user_id] = current_user.id
  	params.require(:lead).permit(:first_name, :last_name, :email, :email2, :phone_number, :phone_number2, :status, :comment, :about_me, :category, :company_url, :user_id)
  end	


end
