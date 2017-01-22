class UsersController < ApplicationController
   load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: :index

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.admin = false
      if @user.save
        login @user
        redirect_to account_path @user.id, notice: 'Account created.'
      else
        render "new"
      end
  end

  def update
      if @user.update(user_params)
        if current_user.admin
          redirect_to @user, notice: "Account modified."
        else
          redirect_to account_path, notice: "Account modified."
        end
      else
          render "edit" # URL changes to admin/users/:id HOW TO PREVENT THAT??? Use render because of @user.errors that need
          # to be displayed
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    if current_user.admin
      redirect_to users_url, notice: "Account deleted."
    else
      redirect_to root_url, notice: "Account deleted."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
    end
end
