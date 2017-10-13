json.extract! task, :id, :title, :description, :expired_at, :importance, :created_at, :updated_at, :completed
json.url task_url(task, format: :json)
