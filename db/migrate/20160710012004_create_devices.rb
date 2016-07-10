class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.integer :hardware_id

      t.timestamps
    end
  end
end
