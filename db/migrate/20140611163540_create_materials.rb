class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :project, index: true
      t.string :item
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
