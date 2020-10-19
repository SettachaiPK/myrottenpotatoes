json.extract! article, :id, :title, :content, :activated, :created_at, :updated_at
json.url article_url(article, format: :json)
