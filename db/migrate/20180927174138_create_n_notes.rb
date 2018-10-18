class CreateNNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :n_notes do |t|
      t.string :name
      t.text :message
      t.references :treatment
      t.timestamps
    end
  end
end
