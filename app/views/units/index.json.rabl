
collection @units

attributes :id, :name, :description, :active, :not_deleted

node :parent do |unit|
  unit.parent.name unless unit.parent.nil?
end
