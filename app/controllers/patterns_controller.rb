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
        @patterns = Pattern.all 
    end

    private

    def pattern_params
        params.require(:pattern).permit(:pattern_name, :level, :gauge, :instructions, :notes, :user_id)
    end

    def set_pattern
        @pattern = Pattern.find_by_id(params[:id])
    end

end
