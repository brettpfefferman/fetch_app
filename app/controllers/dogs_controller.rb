class DogsController < ApplicationController

        def index
            @dogs = Dog.all 
        end

        def show
        end

        def new 
            @dog = Dog.new()
        end

        def create
            # make a dog object with the info from the form
            puts dog_params
            @dog = Dog.new(dog_params)
            @dog.user_id = current_user.id


            # save the dog
            if @dog.save
                flash[:notice] = "You've added your dog!"
                redirect_to dogs_path
            else
                # redirect
                render :new
            end
        end

        def edit
            @dog = current_user.dog 
        end

        def update
            @dog = current_user.dog

            @dog.name = dog_params[:name]
            @dog.age = dog_params[:age]
            @dog.size = dog_params[:size]
            @dog.image_one = dog_params[:image_one]
            @dog.bio = dog_params[:bio]

            if @dog.save
                flash[:notice] = "Saved Dog!"
                puts 'success'
            else
                puts 'error'
            end

            redirect_to root_path
        end

        def destroy
            # @dog.destroy
        end

        private

        def dog_params
            params.require(:dog).permit(:name, :age, :size, :image_one, :bio)
        end
end

