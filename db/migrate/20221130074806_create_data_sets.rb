class CreateDataSets < ActiveRecord::Migration[7.0]
  def change
    create_table :data_sets do |t|
      t.float :temperature
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
