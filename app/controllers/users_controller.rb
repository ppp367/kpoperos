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
    flash[:notice] = "Ahora eres <strong>Concursante</strong>"
    redirect_to home_path
  end

  def salir_concurso
    @user = User.friendly.find(params[:id])
    @user= current_user.update_attribute(:type, nil)
    flash[:info] = "Haz <strong>salido</strong> del concurso"
    redirect_to home_path
  end

end 

