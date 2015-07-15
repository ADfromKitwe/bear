class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :location
      t.text :details
      t.decimal :price
      t.string :status
      t.references :customer, index: true
      
      t.timestamps
    end
  end
end
