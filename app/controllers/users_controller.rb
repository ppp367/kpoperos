class UsersController < ApplicationController
  def index
  end

  def list
  end

  def show
  	#@user = Concursante.friendly.find(params[:id])
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

   private

   def concursar
    @user = Concursante.new
  end

  def set_type
       @user = user 
  end

  def user 
      params[:type] || "user" 
  end

  def user_class 
      user.constantize 
  end

  def prueba
    @user = User.type = "concursante"  
  end

end 

