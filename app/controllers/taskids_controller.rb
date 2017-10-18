class TaskidsController < ApplicationController
  def index
    @task = current_user.tasks.find(params[:id])

    @task.completed = !@task.completed

    respond_to do |format|
      if @task.update(completed: @task.completed)
        format.json { render json: @task, status: :ok, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
end
