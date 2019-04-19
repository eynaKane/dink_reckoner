class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.integer :income_cents, default: 0, null: false

      t.timestamps
    end
  end
end
