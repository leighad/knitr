class SessionsController < ApplicationController

    # def home

    # end

    # def new

    # end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:error] = "Invalid entry! Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.clear 
        # session.delete :user_id 
        redirect_to '/'
    end

    def google_auth
        @user = User.find_or_create_by_google(auth)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end

        #<OmniAuth::AuthHash::InfoHash email="cdversiontwo@gmail.com" email_verified=true 
        #first_name="Leigha" image="https://lh3.googleusercontent.com/-qtqnPU-1J2M/AAAAAAAAAAI/AAAAAAAAAAA/AAKWJJPrFFOODXKPZZj9U9PM5jwf5rWNhg/photo.jpg" 
        #last_name="De La Rosa" name="Leigha De La Rosa" unverified_email="cdversiontwo@gmail.com">
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end