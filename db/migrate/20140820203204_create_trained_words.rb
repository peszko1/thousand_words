class CreateTrainedWords < ActiveRecord::Migration
  def change
    create_table :trained_words do |t|
      t.references :word
      t.integer :status
      t.boolean :learned

      t.timestamps
    end
  end
end
