class Api::V1::PetsController < ApplicationController
  before_action :set_shelter, except: [:index]
  before_action :find_pet, only: [:adopt_me, :show]
  before_action :current_shelter, only: [:update]

  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      pets = @shelter.pets
      render json: {data: pets}, status: :ok
    else
      pets = Pet.all
      render json: {data: pets}, status: :ok
    end
  end

  def create
    pet = @shelter.pets.build(pets_params)
    if pet.valid?
      pet.save
      render json: {data: pet}, status: :created
    else
      render json: {errors: pet.errors.full_messages}, status: :bad_request
    end
  end

  def update
    if @pet.update(pets_params)
      render json: {data: @pet}, status: :ok
    else
      render json: {errors: @pet.errors.full_messages}, status: :bad_request
    end
  end

  def adopt_me
    @pet.is_adopted ? already_adopted : adopt_pet
  end

  def show
    render json: {data: @pet}, status: :ok
  end

  private

  def set_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end

  def find_pet
    pet_id = params[:pet_id] || params[:id]
    @pet = Pet.find(pet_id)
  end

  def pets_params
    params.require(:pet).permit(:name, :breed, :animal_type)
  end

  def adopt_pet
    @pet.adopt_friend
    render json: {data: @pet, message: "You and your new friend #{@pet.name}
are ready for some awesome adventures"}, status: :ok
  end

  def already_adopted
    render json: {error: "#{@pet.name} was already adopted"}
  end

  def current_shelter
    pet_id = params[:pet_id] || params[:id]
    @pet = Pet.find(pet_id)
    render json: {message: 'Only assigned shelter is able to edit'} unless logged_in? && @shelter.id === @pet.shelter_id
  end
end