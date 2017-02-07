class CreateProjectsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :status
      t.text :notes
      t.string :tools
      t.string :materials
      t.string :priority
    end
  end
end
