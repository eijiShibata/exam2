class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(posts_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
      NoticeMailer.sendmail_post(@post).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      reder 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  def confirm
    @post = Post.new(posts_params)
    render :new if @post.invalid?
  end

  private
    def posts_params
      params.require(:post).permit(:title, :content, :photo, :photo_cache)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
