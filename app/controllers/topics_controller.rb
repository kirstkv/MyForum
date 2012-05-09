class TopicsController < ApplicationController
    before_filter :authenticate_user!, :except => [:show, :index]
    def create
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.create(params[:topic])
      redirect_to forum_path(@forum)
    end
    
    def edit
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.find(params[:id])
      @topic.save
      redirect_to forum_path(@forum)
    end
    
    def destroy
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.find(params[:id])
      @topic.destroy
      redirect_to forum_path(@forum)
    end
end
