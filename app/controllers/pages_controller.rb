class PagesController < ApplicationController
  def top
    @tasks = current_user.tasks.where(completed: false)
    @task = Task.new
  end
end
