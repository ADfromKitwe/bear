json.array!(@projects) do |project|
  json.extract! project, :id, :location, :details, :price, :status, :customer_id
  json.url project_url(project, format: :json)
end
