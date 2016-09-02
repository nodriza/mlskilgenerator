class CreateTablas < ActiveRecord::Migration
  def change
    create_table :tablas do |t|
      t.string :clave
      t.string :valor
      t.references :template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
