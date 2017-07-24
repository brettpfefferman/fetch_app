class DogsController < ApplicationController

        def index
            # @dogs = Dog.all 
        end

        def show
        end

        def new 
            # @dog = Dog.new
        end

        def edit

        end

        def update
        end

        def destroy
            @match.destroy
        end
end

