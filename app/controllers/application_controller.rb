class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    auth_header = request.headers['Authorization']
    token = auth_header.split[1] if auth_header
    begin
      JWT.decode(token, 'secret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def authorized_user
    decoded_token = decode_token
    user_id = decode_token[0]['user_id']
    @user = User.find_by(id: user_id) if decoded_token
  end

  def authorize
    render json: { message: 'You have to log in' }, status: :unauthorized unless authorized_user
  end
end
