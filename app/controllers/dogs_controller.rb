class DogsController < ApplicationController
    # Find dog by id for routes in only:
    before_action :get_dog, only: [:show, :update, :destroy]

    # render method takes a hash, it looks like This  
    # def index
    #     render({ :json => "hi" })
    # end

    # GET /dogs
    def index
        @dogs = Dog.all
        render json:  @dogs.to_json(include: :dog_photos)
    end

    # GET /dogs/1
    def show
        render json: @dog.to_json(include: :dog_photos)
    end

    #POST /users/:user_id/dogs
    def create
        dog = Dog.new(dog_params)
        dog.user_id = params[:user_id]

        if dog.save
            render json: {status: 201, dog: dog}
        else
            # Unprocessable entity
            render json: {status: 422, dog: dog}
        end
    end

    # PATCH/PUT /dogs/1
    # This will be behind user authentication!!!
    def update
        @dog.update(dog_params)
        render json: {dog: @dog}
    end

    # DELETE /dogs/1
    # This will be behind user authentication!!!
    def destroy
        @dog.destroy
        render json: {status: 204}
    end

    private

    def get_dog
        @dog = Dog.find(params[:id])
    end

    def dog_params
        # Returns a sanitized hash of the params with nothing extra
        params.required(:dog).permit(:name, :breed, :temperament, :bio, :zip_code)
    end

end