class UsersController < ApplicationController
  def index
  end

  def list
  end

  def show
  	@user = Concursante.friendly.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def concursar
    @user = User.friendly.find(params[:id])
    @user= current_user.update_attribute(:type, "Concursante")
    flash[:notice] = "Ahora eres Concursante"
    redirect_to home_path
  end

end 

