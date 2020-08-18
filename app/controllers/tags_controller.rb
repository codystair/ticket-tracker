class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :require_session, except: [:show, :index]

  def index
    @tags = Tag.with_counts.alphabetical
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path, notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: 'Tag was successfully destroyed.'
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
