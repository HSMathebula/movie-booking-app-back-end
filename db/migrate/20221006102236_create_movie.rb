class CreateMovie < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.float :duration
      t.datetime :time

      t.timestamps
    end
  end
end
