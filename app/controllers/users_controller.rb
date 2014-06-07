class UsersController < ApplicationController
  def index
  end

  def list
  end

  def show
  	@user = User.friendly.find(params[:id])
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
end 