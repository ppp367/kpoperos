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
      current_user.update_attribute(:type, "Concursante")
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
    session[:return_to] ||= request.referer

    @user = User.find_by_username(params[:user_to_add][:username])
    grupo = Group.find_by_name(params[:grupo])
      if @user == nil
        flash[:alert] = "El usuario #{params[:user_to_add][:username]} No está registrado en la página."
        redirect_to session.delete(:return_to) 
      else
        if @user.type == "Concursante"
          flash[:warning] = "El usuario No puede ser agregado porque ya pertenece a otro equipo."
          redirect_to session.delete(:return_to)
        else
          @user.update_attribute(:type, "Concursante")
          grupo.add @user
          flash[:notice] = "Usuario: #{@user.username} agregado Satisfactoriamente al equipo #{grupo.name}."
          redirect_to session.delete(:return_to) 
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
    params.require(:user_to_add).permit(:username, :grupo)
    $usern = user_to_add
  end


end 