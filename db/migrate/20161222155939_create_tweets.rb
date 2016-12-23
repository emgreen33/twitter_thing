class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_user_id
      t.string :full_text, length: 140
      t.string :twitter_id
      t.timestamps(null:false)
    end
  end
end
