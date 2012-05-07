class TopicsController < ApplicationController
    def create
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.create(params[:topic])
      redirect_to forum_path(@forum)
    end
    
    def destroy
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.find(params[:id])
      @topic.destroy
      redirect_to forum_path(@forum)
    end
end
