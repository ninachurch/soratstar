class CreateThemes < ActiveRecord::Migration
  def change
    create_table :crafts do |t|
      t.string :name
    end
  end
end
