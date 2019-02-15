class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])
    @event = Event.all
  end

  def edit
    @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], description: params[:description], is_admin: params[:is_admin])
      redirect_to admins_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_path
   end

  def only_see_own_page
    @user = User.find(params[:id])
  
    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
end
