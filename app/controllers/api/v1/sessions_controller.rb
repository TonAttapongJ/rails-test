class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_current_user_from_jwt, only: [:me, :sign_out]
    def sign_up 
        puts "sign up was called"
        user = User.new(user_params)
        user.save!
        render json: { success: true }, status: :created
    end

    def sign_in
        user = User.find_by_email(params[:email])
        if user.confirmed? && user.valid_password?(params[:password])
            render json: { success: true, jwt: user.jwt(1.days.from_now)}, status: :created
        else 
            render json: { success: false }, status: :unauthorized
        end
    end

    def sign_out
        @current_user.generate_auth_token(true)
        @current_user.save
        render json: { success: true }
    end

    def me 
        # Call `set_current_user_from_jwt` from super class
        render json: { success: true, user: @current_user.as_json }
    end

    private 
    def user_params
        params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :admin_enabled)
    end
end
