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
    if (size == 'Not Important' && gender == 'Not Important') 
      @dogs = Dog.all.where.not(user_id: current_user.id)
      return
    else 
      @dogs = Dog.where(:size => size).all.where.not(user_id: current_user.id)
      return
    end

    @dogs = @dogs.to_a

    # get users' dogs
    if (gender == 'Not Important')
      @users = User.all
    else
      @users = User.where(:gender => gender).all
    end
    
    @users.each do |user|
      if (user.dog)
        puts 'adding users dog' 
        @dogs << user.dog
      end
    end
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

    # --------------

    # # queryParams = params.permit(:gender, :size, :age)
    # gender = params[:gender]
    # size = params[:size] 
    # age = params[:age]

    # @users = User.where.not(id: current_user.id).to_a.map(&:serializable_hash)
    # @dogs = Dog.where.not(user: current_user).to_a.map(&:serializable_hash)

    # mappings = {"age" => "dog_age", "bio" => "dog_bio", "name" => "dog_name"}
    # @dogs.each do |dog|
    #   dog.keys.each { |k| dog[mappings[k]] = dog.delete(k) if mappings[k] }
    # end

    # # merge the users and dogs hashes
    # @users.each do |user|
    #   user.reverse_merge!(@dogs.detect {|dog| dog["user_id"] == user["id"]})
    # end

    # if (size != 'Not Important') 
    #   @users.select! do |user|
    #     user["size"] == size
    #   end
    # end

    # if (gender != 'Not Important')
    #   @users.select! do |user|
    #     user["gender"] == gender
    #   end
    # end

    # age_range = {
    #   "18-24" => {low: 18, high: 24},
    #   "25-34" => {low: 25, high: 34},
    #   "35-50" => {low: 35, high: 50},
    #   "51-70" => {low: 51, high: 70},
    #   "71+" => {low: 71, high: 199}
    # }

    # if (age != 'Not Important')
    #   @users.select! do |user|
    #     user["age"] >= age_range[age][:low] && user["age"] <= age_range[age][:high]
    #   end
    # end

    # render :index

  end

end