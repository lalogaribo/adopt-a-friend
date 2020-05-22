class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  # SECRET_KEY = "react_project"

  def encode_token(payload = {}, exp = 1.hour.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV['SECRET_KEY'])
  end

  def token
    request.headers["Authorization"]
  end
  #
  # def authenticate_user
  #   jwt = cookies.signed[:token]
  #   token = JWT.decode(jwt, SECRET_KEY, true, algorithm: "HS256")
  #   token
  # end

  def current_user
    user ||= User.find_by(id: user_id)
  end

  def send_token(token)
    cookies.signed[:token] = {value: token, httponly: true, expires: 1.hour.from_now}
  end

  def decode_token
    jwt = cookies.signed[:token]
    begin
      JWT.decode(jwt, ENV['SECRET_KEY'], true, algorithm: "HS256")
    rescue JWT::DecodeError
      [{}]
    end
  end

  def user_id
    decode_token.first["user_id"]
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
  end
end
