class PostsController < ApplicationController

  def new
    @posts = Post.all
    @post = Post.new
  end

  def create

       post = Post.new(post_params)

   if  post.save
       flash[:notice] = "Book was successfully created."
       redirect_to post_path(post.id)
    end
  end
  def next
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     post = Post.find(params[:id])
   if  post.update(post_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to post_path(post.id)
  end
end

  def destroy
     post = Post.find(params[:id])
   if  post.destroy
       flash[:notice] = "Book was successfully destroyed.

"
       redirect_to action: 'new'
  end
end

  def back
    redirect_to action: 'new'
  end
    private

  def post_params
      params.require(:post).permit(:title, :body)
  end
end
