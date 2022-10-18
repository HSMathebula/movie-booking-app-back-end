class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user&.authenticate(@user.password)
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity

    end
  end

  def login
    @user = User.find_by(name: user_params[:name])

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(params[:id])
    if @user.destroy
      render json: { message: ' You logout successfully!' }, status: 200
    else
      render json: { error: 'Error logout' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
