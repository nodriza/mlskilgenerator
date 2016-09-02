class CreateCompatibles < ActiveRecord::Migration
  def change
    create_table :compatibles do |t|
      t.string :list
      t.references :template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
