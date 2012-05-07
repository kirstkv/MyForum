class PostsController < ApplicationController
      def create
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topic.find(params[:topic_id])
      @post = @forum.topic.posts.create(params[:post])
      redirect_to forum_path(@forum)
    end
    
    def destroy
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.find(params[:id])
      @topic.destroy
      redirect_to forum_path(@forum)
    end
end
