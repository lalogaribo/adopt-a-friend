class Api::V1::SessionsController < ApplicationController
  before_action :authorized_shelter, only: [:show]

  def create
    shelter = Shelter.find_by(email: login_params[:email])
    if shelter && shelter.authenticate(login_params[:password])
      token = encode_token({shelter_id: shelter.id})
      send_token(token)
      serialized_response = ShelterSerializer.new(shelter)
      render json: {message: "Welcome back #{shelter.name}", data: serialized_response}, status: :ok
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  def show
    render json: {data: {id: current_shelter.id,
                         username: current_shelter.name,
                         email: current_shelter.email,
                         location: current_shelter.location,
                         pets: current_shelter.pets}}
  end

  def destroy
    cookies.delete(:token)
    render json: {message: 'Loged out succesfully '}, status: :ok
  end

  private

  def login_params
    params.require(:shelter).permit(:email, :password)
  end
end