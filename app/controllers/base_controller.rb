class BaseController < ApplicationController

  before_action :authenticate_user!

  private 
  # Manager access
  def check_manager
  	unless current_user.is_manager?
      redirect_to root_path		
    end		
  end	

end
