class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      send_token(token)
      render json: { user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email,
                                 :address, :password, :password_confirmation)
  end
end
