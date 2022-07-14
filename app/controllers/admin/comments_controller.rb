class Admin::CommentsController < AdminController
    before_action :authenticate_user!
    #before_action :require_comment, only:[:show, :destroy, :edit, :update]
    before_action :set_post, only:[:index, :create, :destroy, :edit, :update]
    def index
        @comments = @post.comments.all
    end

    def new 
        @comment = Comment.new
    end

    def create
        
        @comment = @post.comments.new(comment_params)
        @comment.save

        redirect_to admin_post_path(@post)
    end

    def edit
        @comment = @post.comments.find(params[:id])
    end
    def update
        @comment= Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to  admin_post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
      
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to admin_post_path(@post)
        
    end

    private
    def comment_params
        params.required(:comment).permit(:body, :user_id, :commentable_id, :commentable_type)
    end

    def set_post
        @post = Post.find_by(id: params[:post_id])
    end
    


end
