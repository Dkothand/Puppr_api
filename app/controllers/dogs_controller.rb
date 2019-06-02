class DogsController < ApplicationController

    # render method takes a hash, it looks like This  
    # def index
    #     render({ :json => "hi" })
    # end

    def index
        render json: Dog.all
    end

end