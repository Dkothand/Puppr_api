class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # Check for authentication token for user routes except for login/create
  before_action :authenticate_token, except: [:login, :create]
  # Checks user id to user_id in token for routes except for login/create/index
  before_action :authorize_user, except: [:login, :create, :index]


  # POST /users/login - user login
  def login
    user = User.find_by(username: params[:user][:username])
    # authenticate method from has_secure_password in user model
    if user && user.authenticate(params[:user][:password])
      token = create_token(user.id, user.username)
      render json: {status: 200, token: token, user: user}
    else
      render json: {status: 401, message: "Unauthorized"}
    end
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: get_current_user
  end

  # GET /users/1/dog
  # Get current users, dog
  def get_dogs
    user_dog = User.find(params[:id]).dog
    if user_dog
      render json: user_dog.to_json(include: :dog_photos)
    else
      render json: error, status: :unprocessable_entity
    end
  end

  # POST /users - user signup
  def create
    # Insert new user in database
    user = User.new(user_params)

    if user.save
      # On success, send token information to authenticate user
      token = create_token(user.id, user.username)
      render json: {status: 200, token: token, user: user}
      # render json: @user, status: :created, location: @user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Create token with payload
    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end
    
    # Returns hash with users id and username to be decrypted
    def payload(id, username)
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
