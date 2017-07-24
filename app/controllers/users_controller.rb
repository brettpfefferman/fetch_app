class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Congratulations! You have an account with Fetch!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user
      @user = current_user
      @dog = @user.dog
    else 
      redirect_to root_path
    end
  end

  def update
    # make a user object for the current user
    @user = current_user

    # update the user with the info from the form
    @user.phone = user_params[:phone]
    @user.age = user_params[:age]
    @user.gender = user_params[:gender]
    @user.bio = user_params[:bio]

    # save the user
    @user.save

    # redirect
    redirect_to '/users/settings'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :age, :gender, :phone) 
    end
end
