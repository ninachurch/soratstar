class CreateCrafts < ActiveRecord::Migration
  def change
     create_table :crafts do |t|
      t.string :name
      t.string :description
      t.string :source_url
      t.text :image_url
      t.belongs_to :theme
    end
  end
end
