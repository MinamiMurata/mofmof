class CreateAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accesses do |t|
      t.string :line
      t.string :station
      t.integer :time
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
