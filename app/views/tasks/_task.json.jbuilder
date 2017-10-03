json.extract! task, :id, :title, :description, :expired_at, :importance, :created_at, :updated_at
json.url task_url(task, format: :json)
