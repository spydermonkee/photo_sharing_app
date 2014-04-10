class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to :back
    else
      render tags_path
    end
  end

private
  def tag_params
    params.require(:tag).permit(:user_id, :post_id)
  end
end
