class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def list
  end

  def show
  	@group = Group.friendly.find(params[:id].downcase)
  end

  def new
  end

  def create
      @group = Group.new(group_params)
      @group.add current_user

      if @group.save
        flash[:notice] = "Grupo creado Satisfactoriamente"
        redirect_to root_path
      else
        flash[:alert] = "Error al crear el grupo"
        render "new"
      end
  end

  def edit
  end

  def add_member
    @user = User.find_by_email!("pedromotad@gmail.com")
    if @user == nil
      flash[:alert] = "El usuario no se encuntra registrado en la pagina"
      redirect_to root_path
    else
      if @user.in_group?(@group)
        flash[:warning] = "El usuario ya pertenece a ese grupo."
      else
        @group.add @user
        flash[:notice] = "Usuario agregado Satisfactoriamente"
        redirect_to root_path
      end 
    end
  end

  def update
  end

  def delete
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def group_name
    params.require(:group).permit(:name)
  end

  def user_to_add
    params.require(:user_to_add).permit(:email)
  end


end 