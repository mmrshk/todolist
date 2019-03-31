class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.string :file

      t.timestamps
    end
  end
end
