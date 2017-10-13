class PagesController < ApplicationController
  def top
    @tasks = Task.where(completed: false)
    @task = Task.new
  end
end
