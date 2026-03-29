class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :destroy]

    def show

    end

    def new
        @content = Content.find(params[:content_id])
        @post = current_user.posts.build
        @post.content = @content
    end

    def create
        @post = current_user.post(post_params)
        if @post.save
            flash[:notice] = "感想を投稿しました！"
            redirect_to content_path(@content)
        end
    end

    def destroy
    end


#########################################################################
    private

    def post_params
        params.require(:post).permit(:title, :body, :score)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
