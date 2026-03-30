class ContentsController < ApplicationController
    before_action :authenticate_user!, except: :index
    before_action :set_content, only: [:show, :edit, :update, :destroy]
    #コンテンツ検索結果表示画面
    def index
        @contents = Content.all
        if params[:keyword].present?
            #contentモデルのtitle/genre/authorカラムを対象にあいまい検索。
            @contents = @contents.search_all_columns(params[:keyword])
        end

        if params[:tag_name].present?
            @contents = @contents.search_by_tag(params[:tag_name])
        end

        if params[:genre].present?
            @contents = @contents.search_by_genre(params[:genre])
        end
    end

    #コンテンツ一覧から飛ぶコメント閲覧画面へ
    def show
        #set_contentする
        @posts = Post.where(content_id: @content.id)
    end

    #コンテンツ新規登録画面
    def new
        @content = current_user.contents.build
    end

    #↑の登録処理
    def create
        @content = current_user.contents.build(content_params)
        if @content.save
            flash[:notice] = "コンテンツを登録しました!"
            redirect_to content_path(@content)
        else
            render "contents/index", status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def my_contents
        @contents = current_user.contents
    end
    #################################################################################################
    private

    def content_params
        params.require(:content).permit( :title, :detail, :genre, :manufacturer, :author, :content_image )
    end

    def set_content
        @content = Content.find(params[:id])
    end
end
