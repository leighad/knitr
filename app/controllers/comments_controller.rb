class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:pattern_id] && @pattern = Pattern.find_by_id(params[:pattern_id])
            @comment = @post.comments.build(comment_params)
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new 
        end
    end

    def show
        set_comment
    end

    def index
        if params[:pattern_id] && @pattern = Pattern.find_by_id(params[:pattern_id])
            @comments = @pattern.comments 
        else
            @comments = Comment.all 
        end
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
        params.require(:comment).permit(:rating, :content, :pattern_id, :user_id)
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end
end
