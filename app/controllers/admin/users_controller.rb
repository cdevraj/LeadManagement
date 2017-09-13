class Admin::UsersController < BaseAdminController

  # List of all users
  def list_users
  	@users = User.all
  end  	

  # Assign lead generator to manager
  def assign_manager
  	user = User.find(params[:user_id].to_i)
    manager = user.my_manager
  	if manager.blank?
	    UserLeadGenerator.create(user_id: params[:manager_id], lead_generator_id: user.id)		
    else
      manager.update_attributes(user_id: params[:manager_id])
    end		
  	redirect_to admin_list_users_path
  end	

end
