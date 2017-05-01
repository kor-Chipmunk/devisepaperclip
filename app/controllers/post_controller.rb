class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
  end

  def create
    newPost = Post.new
    newPost.title = params[:title]
    newPost.content = params[:content]
    newPost.user = current_user
    if params[:avatar]
      newPost.avatar = params[:avatar]
    end
    newPost.save
    
    # newPost = Post.create(title: params[:title], content: params[:content])
    
    # redirect_to '/'
    redirect_to "/show/#{newPost.id}"
  end

  def destroy
    destroyPost = Post.find(params[:id])
    destroyPost.destroy
    
    redirect_to '/'
  end

  def index
    @listPost = Post.all
  end

  def show
    @showPost = Post.find(params[:id])
  end

  def edit
    @editPost = Post.find(params[:id])
  end

  def update
    updatePost = Post.find(params[:id])
    updatePost.title = params[:title]
    updatePost.content = params[:content]
    if params[:avatar]
      updatePost.avatar = params[:avatar]
    end
    updatePost.save
    
    # updatePost.update(title: params[:title], content: params[:content])
    
    # redirect_to '/'
    redirect_to "/show/#{updatePost.id}"
  end
end
