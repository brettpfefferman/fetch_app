class MatchesController < ApplicationController
  
  def new
    
  end

  def index
    # params( :age :gender :size)
    # @user = User.new(param.require(:user).permit(:gender, :age))

    queryParams = params.permit(:gender, :size)
    gender = queryParams[:gender]
    size = queryParams[:size] 
    puts size

    # get dogs first
    if (size == 'Not Important') 
      @dogs = Dog.all
    else 
      @dogs = Dog.where(:size => size).all
    end

    @dogs = @dogs.to_a

    # get users' dogs
    if (gender == 'Not Important')
      @users = User.all
    else
      @users = User.where(:gender => gender).all
    end
    
    # @users.each do |user|
    #   if (user.dog) 
    #     @dogs << user.dog
    #   end
    # end
    
  end

  def create
    # if user does not include age, gender or size, leave data.
    # puts params

    queryString = {
      :gender => params[:gender],
      :size => params[:size]
    }

    # puts queryString.to_query


    redirect_to '/matches?' + queryString.to_query 

  end

end