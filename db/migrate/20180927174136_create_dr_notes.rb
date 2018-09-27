class CreateDrNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :dr_notes do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
