class PatternsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @pattern = Pattern.new 
    end

    def create
        pattern = current_user.patterns.build(pattern_params)
        if pattern.save
            redirect_to pattern_path(pattern)
        else
            render :new
        end
    end

    def show
        set_pattern
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @patterns = @user.patterns
        else
            # @error = "User doesn't exist" if params[:user_id]
            @patterns = Pattern.all 
        end
    end

    private

    def pattern_params
        params.require(:pattern).permit(:pattern_name, :level, :gauge, :instructions, :notes, :user_id)
    end

    def set_pattern
        @pattern = Pattern.find_by_id(params[:id])
    end

end
