class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.boolean :completed, default: false, null: false
      t.integer :position
      t.datetime :deadline

      t.timestamps
    end
  end
end
