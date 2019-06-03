class ApplicationController < ActionController::API

    # Authenticates user on user routes, must be logged in to access user routes
    def authenticate_token
        puts "AUTHENTICATE JWT"
        render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
    end

    # Removes 'Bearer' and returns just token hash
    def bearer_token                          
        header = request.env['HTTP_AUTHORIZATION']
        pattern = /^Bearer /
        header.gsub(pattern, '') if header && header.match(pattern)                    
    end
    
    # Decodes token hash
    def decode_token(token_input)
        JWT.decode(token_input, ENV['JWT_SECRET'], true)  
    rescue                       
        render json: { status: 401, message: 'Unauthorized' }                          
    end 

    # Return current user's information from database
    def get_current_user
        return if !bearer_token
        decoded_jwt = decode_token(bearer_token)
        User.find(decoded_jwt[0]["user"]["id"])
    end

    # Checks currently logged in user's id to user_id in token of last login, keeps user from accessing other user's routes
    def authorize_user
        puts "AUTHORIZE USER"
        puts "user id: #{get_current_user.id}"
        puts "params: #{params[:id]}"
        render json: { status: 401, message: "Unauthorized" } unless get_current_user.id == params[:id].to_i
    end
end
