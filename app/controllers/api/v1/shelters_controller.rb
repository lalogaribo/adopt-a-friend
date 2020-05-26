class Api::V1::SheltersController < ApplicationController
  before_action :find_shelter, only: [:show, :destroy]

  def index
    shelters = Shelter.all
    render json: {data: shelters}, status: :ok
  end

  def create
    shelter = Shelter.create(shelter_params)
    if shelter.valid?
      token = encode_token({shelter_id: shelter.id})
      send_token(token)
      render json: {data: shelter}, status: :created
    else
      render json: {errors: shelter.errors.full_messages}, status: :bad_request
    end
  end

  def show
    if @shelter
      render json: {data: @shelter}, status: :ok
    else
      not_found unless @shelter
    end
  end

  def destroy
    @shelter.destroy
    render json: {message: 'Shelter was deleted succesfuly'}, status: :ok
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :location, :phone_number, :password, :email)
  end

  def find_shelter
    @shelter = Shelter.find_by(id: params[:id])
  end

  def not_found
    render json: {message: 'Shelter not found'}, status: :not_found
  end

end