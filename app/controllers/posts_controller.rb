class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :destroy]

    def index
        @posts = current_user.posts
    end

    def show

    end

    def new
        @content = Content.find(params[:content_id])
        @post = current_user.posts.build
        @post.content = @content
    end

    def create
        @content = Content.find(params[:content_id])
        @post = current_user.posts.build(post_params)
        @post.content = @content
        if @post.save
            flash[:notice] = "レビューを投稿しました！"
            redirect_to content_path(@content)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @content = @post.content
        @post.destroy
        flash[:notice] = "- レビューを削除しました -"
        redirect_to posts_path
    end


#########################################################################
    private

    def post_params
        params.require(:post).permit(:title, :body, :score, :published)
    end

    def set_post
        @post = current_user.posts.find(params[:id])
    end
end
