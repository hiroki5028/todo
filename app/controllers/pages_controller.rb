class PagesController < ApplicationController
  def top
    @tasks = Task.where(completed: false)
  end
end
