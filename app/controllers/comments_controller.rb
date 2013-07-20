class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = 'Your comment was added.'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    redirect_to :back, notice: "Your vote was recorded!"
  end


end
