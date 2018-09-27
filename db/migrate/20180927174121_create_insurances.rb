class CreateInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :insurances do |t|
      t.string :policy_num
      t.string :policy_name
      t.string :group_num

      t.timestamps
    end
  end
end
