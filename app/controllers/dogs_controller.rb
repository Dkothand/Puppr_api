class DogsController < ApplicationController

    # render method takes a hash, it looks like This  
    # def index
    #     render({ :json => "hi" })
    # end

    # GET /dogs
    def index
        render json: {status: 200, dogs: Dog.all}
    end

    # GET /dogs/1
    def show
        dog = Dog.find(params[:id])
        render json: dog.to_json(include: :dog_photos)
    end

end