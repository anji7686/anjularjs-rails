class UsersController < ApplicationController
  #before_action :get_user, except: [:index, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def new
    @user = User.new
  end

  def index
    @user = User.all
    respond_with(@users) do |format|
      format.json { render :json => @user.as_json }
      format.html
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.as_json, status: :ok
    else
      render json: {user: @user.errors, status: :no_content}
    end
  end      

  def show
    respond_with(@user.as_json)
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user.as_json, status: :ok 
    else
      render json: {user: @user.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @user.destroy
    render json: {status: :ok}
  end

  private

  def user_params
    unless params["user"]["profiles"].blank?
      params["user"]["profiles_attributes"] = params["user"]["profiles"]
      params["user"].delete("profiles")
    end
    params.fetch(:user, {}).permit(:first_name, :last_name, :email, :phone, :username, :password,
                                   :profiles_attributes => [:id, :address1, :address2, :address3, :mobile, :location, :street, :city, :state, :country, :zipcode, :_destroy, :user_id])
  end

  def get_user
    @user = User.find(params[:id])
    render json: {status: :not_found} unless @user
  end

  def set_user
    @user = current_user
  end
end
