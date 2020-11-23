class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
        format.js {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
        format.js {render :edit}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nombres, :apellidos, :direccion, :telefono, :password, :email)
    end

end