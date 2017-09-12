class BaseAdminController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  # Admin access
  def check_admin
  	unless current_user.is_admin?
  	  redirect_to root_path	
  	end 	
  end	

end
