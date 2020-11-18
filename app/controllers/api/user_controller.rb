class Api::UserController < ApplicationController
	before_action :find_user, only: [:show, :update, :destroy]

	def index
		@users = User.all
		render json: @users, status: :ok
	end

	def show
		if @user.present?
			render json: @user , status: :ok
		else
			render json: { errors: 'User not found'}, status: :not_found
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: {message: 'success', data: @user}, status: :ok
		else
			render json: { errors: @user.errors} , status: :ok
		end
	end

  def update
    if @user.present?
      @user.update(user_params)
      render json: {message: 'success', data: @user}
    else
      render json: { errors: 'User not found'}, status: :not_found
    end
  end

  def destroy
  	if @user.present?
      @user.destroy!
      render json: {message: 'success', status: :ok}
    else
      render json: { errors: 'User not found'}, status: :not_found
    end
  end


  def typehead
  	binding.pry
    @users = User.any_of({firstName => /. *#{params[:input]}}). */},
    {:lastName => /. *#{params[:input]}}). */},
    {:email => /. *#{params[:input]}}). */})
    render json: {message: 'success', data: @users}
  end

	private

  def find_user
    @user = User.where(id: params[:id].to_i)&.last
  end

	def user_params
		params.permit(:email, :firstName, :lastName)
	end

end
