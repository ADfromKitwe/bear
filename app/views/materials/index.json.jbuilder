json.array!(@materials) do |material|
  json.extract! material, :id, :project_id, :item, :description, :price
  json.url material_url(material, format: :json)
end
