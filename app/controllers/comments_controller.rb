class CommentsController < ApplicationController

  def create
    @commentable = extract_commentable
    fail
  end

  private

    def extract_commentable
      resource, id = request.path.split('/')[1,2]
      resource.singularize.classify.constantize.find(id)
    end

end
