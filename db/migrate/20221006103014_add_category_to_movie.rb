class AddCategoryToMovie < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :category, null: false, foreign_key: true, index:true
  end
end
