class Api::V1::AuthController < ApplicationController
  before_action :authorized, only: [:show]

  def create
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(login_params[:password])
      token = encode_token({user_id: user.id})
      send_token(token)
      serialized_response = UserSerializer.new(user)
      render json: {message: 'Loged in', data: serialized_response}, status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  def show
    render json: {user: {id: current_user.id, username: current_user.username, email: current_user.email, address: current_user.address}}
  end

  def destroy
    cookies.delete(:token)
    render json: {message: 'Loged out succesfully '}, status: :ok
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
