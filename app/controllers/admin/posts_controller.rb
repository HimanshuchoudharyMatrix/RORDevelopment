class Admin::PostsController < AdminController
before_action :required_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all.order("id desc").page(params[:page]).per(3)
   
  end

  def show
    
  end

  def new
    @post = Post.new
   
  end

  def create
    @post = Post.new(post_params)
   if @post.save
        redirect_to  admin_posts_path
     else
       render 'new'
     end
  end

  def edit
    
  end

  def update
    if @post.update(edit_params)
        redirect_to admin_posts_path(@post)
    else
        render 'edit'
    end
  end

  def destroy
      @post.destroy
      redirect_to admin_posts_path
  end

  private
  def post_params
    params.required(:post).permit(:title, :description, :image, :published, :user_id)
  end

  def edit_params
    params.required(:post).permit(:title, :description, :image, :published)
  end

  def required_post
    @post = Post.find(params[:id])
  end
end
