json.extract! user, :id, :username, :last_score, :created_at, :updated_at
json.url user_url(user, format: :json)
