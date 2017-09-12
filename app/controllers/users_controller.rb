class UsersController < BaseController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def lead_generators
    @lead_generators = current_user.lead_generators
  end  

end
