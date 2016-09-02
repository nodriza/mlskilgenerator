class CreateSecondlists < ActiveRecord::Migration
  def change
    create_table :secondlists do |t|
      t.string :titulo
      t.text :list
      t.references :template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
