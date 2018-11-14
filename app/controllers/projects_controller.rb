class ProjectsController < ApplicationController
    def Index
    end

    def new
        @project = project.new
    end

end
