class AddPictureToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :picture, :string
  end
end
