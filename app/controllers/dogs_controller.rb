class DogsController < ApplicationController
    before_action :get_dog, only: [:show]

    # render method takes a hash, it looks like This  
    # def index
    #     render({ :json => "hi" })
    # end

    # GET /dogs
    def index
        @dogs = Dog.all
        render json: {status: 200, dogs: @dogs}
    end

    # GET /dogs/1
    def show
        render json: @dog.to_json(include: :dog_photos)
    end

    private

    def get_dog
        @dog = Dog.find(params[:id])
    end

end