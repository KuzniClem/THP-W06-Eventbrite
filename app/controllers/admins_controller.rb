class AdminsController < ApplicationController
  before_action :is_admin?
 def index
 end

 def create
 end

 def new
 end

 def edit
 end

 def update
 end

 def show
 end

 def destroy
 end

 def is_admin?
  if user_signed_in? && !current_user.is_admin
    redirect_to root_path
  end
 end
end
