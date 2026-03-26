class PagesController < ApplicationController
    def top
        @content = Content.last
    end

#######################################################

end
