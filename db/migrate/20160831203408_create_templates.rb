class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :head
      t.text :body
      t.string :imgurl

      t.timestamps null: false
    end
  end
end
