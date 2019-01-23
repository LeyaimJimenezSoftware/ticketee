class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at

  has_one :tickets
end
