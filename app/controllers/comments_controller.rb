class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_pat
        else
            render :new 
        end
    end

    def show
        set_comment
    end

    def index
        @comments = Comment.all 
    end

    def edit
        set_comment
    end

    def update
        set_comment
    end

    def destroy

    end

    private

    def comment_params
        params.require(:comment).permit()
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end
end
