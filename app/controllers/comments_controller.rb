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
    @comment = Comment.find(params[:id])
    if current_user.already_voted_on? @comment
      flash[:error] = "You can only vote once!"
      redirect_to :back
    else
      Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
      redirect_to :back, notice: "Your vote was recorded!"
    end
  end


end
