class CreateItems < ActiveRecord::Migration
  def change
    create_table :crafts do |t|
      t.string :name
      t.belongs_to :crafts
    end
  end
end
