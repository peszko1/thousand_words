class AddWordIndexToWords < ActiveRecord::Migration
  def change
    add_column :words, :word_index, :integer
  end
end
