class DogsController < ApplicationController

        def index
            @curr_user = current_user
            @dogs = Dog.find_by(user_id: @curr_user.id)
        end

        def show
        end

        def create
            # make a dog object with the info from the form
            @dog = Dog.new(dog_params)
            @dog.user_id = current_user.id


            # save the dog
            if @dog.save
                flash[:notice] = "You've added your dog!"
                redirect_to dogs_path
            else
                # redirect
                render :edit
            end
        end

        def edit

            @user = current_user 
            @dog = Dog.find_by(user_id: @user.id)

            if @dog 
                puts "You don't have a dog"
            else 
                @new_dog = Dog.new
            end
            
        end

        def update
            @dog = Dog.find_by(user_id: current_user.id)
            @dog.update_attributes(dog_params)

            if @dog.save
                flash[:notice] = "Saved Dog!"
                puts 'success'
            else
                puts 'error'
            end

            redirect_to '/dogs'
        end

        def destroy
            @dog = Dog.find(params[:id])
            @dog.destroy
            redirect_to '/dogs'
        end

        private

        def dog_params
            params.require(:dog).permit(:name, :age, :breed, :size, :image, :bio)
        end
end

