class CommentsController < ApplicationController

  def create
    @commentable = extract_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.save ? successful_create : failed_create
  end

  private

    def extract_commentable
      resource, id = request.path.split('/')[1,2]
      resource.singularize.classify.constantize.find(id)
    end

    def successful_create
      redirect_back fallback_location: root_path
    end

    def failed_create
      flash[:error] = "Sorry, we couldn't create a comment." # TODO: remove?
      redirect_back fallback_location: root_path
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
