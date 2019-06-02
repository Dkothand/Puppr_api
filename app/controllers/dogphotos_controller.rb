class DogphotosController < ApplicationController

    #GET /dogphotos
    def index
        @dogphotos = DogPhoto.all
        render json: @dogphotos
    end

    #POST /dogs/:dog_id/dogphotos
    def create
        @dogphoto = DogPhoto.new(dogphoto_params)
        @dogphoto.dog_id = params[:dog_id]

        if @dogphoto.save
            render json: @dogphoto, status: :created
        else
            render json: @dogphoto.error, status: :unprocessable_entity
        end
    end


    private
    # Trusted parameter "whitelist"
    def dogphoto_params
        params.require(:dogphoto).permit(:img_link, :details)
    end

end