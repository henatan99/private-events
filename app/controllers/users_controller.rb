class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path,
                  notice: "User #{@user.name} successfully created! Thank you for signing up!"
    else
      render :new
    end
  end

  def destroy
    @user = Post.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
