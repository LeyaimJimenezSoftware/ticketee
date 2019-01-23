class TicketSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :project_id, :created_at, :author_id
end
