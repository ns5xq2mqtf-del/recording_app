class PostsController < ApplicationController
    def new
        @content = Content.find(params[:content_id])
        @post = current_user.posts.build
        @post.content = @content
    end
end
