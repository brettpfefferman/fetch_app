class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Congratulations! You have an account with Fetch!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    if current_user
      @user = current_user
      @dog = Dog.find_by(user_id: @user.id)
    else 
      redirect_to root_path
    end
  end

  def update

    puts '-------------------------'
    puts user_params

    if current_user.update_attributes(user_params)
      puts "Update is successful"
      puts current_user

      puts '--------'

      
      redirect_to root_path
    else 
      render :edit
    end

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :age, :gender, :phone) 
    end

end
