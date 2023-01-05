class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    puts "user_email: #{params[:email]}"
    @user = User.find_by_email(params[:email])
    if !!@user = @user.authenticate(params:[:password])
      session[:user_id] = @user.id
      redirect_to admin_products_path
    end
  end

  def destroy 
    puts "descripawpdawdkakl;wjdklawjdkjawkdjawkld"
  end
  private 
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
