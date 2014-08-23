class AddUserIdToTrainedWords < ActiveRecord::Migration
  def change
    add_column :trained_words, :user_id, :integer
  end
end
