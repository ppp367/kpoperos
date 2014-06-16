class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def list
  end

  def show
  	@group = Group.friendly.find(params[:id].downcase)
    @comments = @group.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@group, current_user.id, "")
  end

  def new
  end

  def create
      if current_user.type == "Concursante"
        flash[:alert] = "Ya perteneces a un equipo."
        redirect_to root_path
      else
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

  def votar
    session[:return_to] ||= request.referer
    @group = Group.find_by_name(params[:grupo])
    @group.vote_by :voter => current_user
    flash[:notice] = "Haz votado por #{@group.name}."
    redirect_to session.delete(:return_to) 
  end

  def desvotar
    session[:return_to] ||= request.referer
    @group = Group.find_by_name(params[:grupo])
    @group.unvote_by current_user
    flash[:info] = "Haz Anulado tu voto por #{@group.name}."
    redirect_to session.delete(:return_to) 
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