class ContentsController < ApplicationController
    def index
        @contents = Content.all
        if params[:keyword].present?
            #contentモデルのtitle/genre/authorカラムを対象にあいまい検索。
            @contents = @contents.search_all_columns(params[:keyword])
        end
    end
end
