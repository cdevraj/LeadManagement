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

  # Manager can change the owner of the lead
  def change_lead_owner
    lead = Lead.where(id: params[:lead_id]).last
    if lead.present? && lead.user_id == current_user.id && current_user.is_manager?
      lead.update_attributes(user_id: params[:user_id])
    end  
    redirect_to leads_path
  end 

  private
  def lead_params
  	params[:lead][:user_id] = current_user.id
  	params.require(:lead).permit(:first_name, :last_name, :email, :email2, :phone_number, :phone_number2, :status, :comment, :about_me, :category, :company_url, :user_id)
  end	


end
