class DogphotosController < ApplicationController

    #GET /dogphotos
    def index
        @dogphotos = DogPhoto.all
        render json: @dogphotos
    end

end