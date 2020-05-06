class UsersController < ApplicationController
    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new 
        end
    end

    def show

    end

    private

    # def set_user
    #     @user = User.find_by_id(params[:user_id])
    # end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    # def all_users
    #     User.all 
    # end

    #play around with all_users to learn more
end
