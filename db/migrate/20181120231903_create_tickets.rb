class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps null: false
    end
  end
end
