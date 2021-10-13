class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params) 
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to @post
  	else
  		render :new
  	end
  end

  def edit
	  @post = Post.find(params[:id])
	  unless @post.user_id == current_user.id
	  	redirect_to root_path
	  end	
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render :edit
  	end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

 private
	 def post_params
	 	params.require(:post).permit(:title, :description, :image)
	 end
end
