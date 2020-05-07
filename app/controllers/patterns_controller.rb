class PatternsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @pattern = Pattern.new 
    end

end
