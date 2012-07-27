class AddTur < ActiveRecord::Migration
  def up
    add_column :books, :tur, :integer
  end

  def down
  end
end
