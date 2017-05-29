class HomeController < ApplicationController

  def home
    @startups = Task.all.where(task_type: 1)
  end

  def research
   @research_projects  = Task.all.where(task_type: 2)
  end
end
