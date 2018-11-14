class CreateProjects < ActiveRecord::Migration[5.2]
  def up
   remove_column :projects, :name
    end
  end

  def down
    add_column :projects, :name, :string 
  end

end
