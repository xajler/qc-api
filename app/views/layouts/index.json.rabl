collection @units

attributes :id, :name, :description, :active, :not_deleted

glue :parent do
  attributes name: :parent_name
end
  
