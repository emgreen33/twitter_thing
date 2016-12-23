class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :handle, length: 20
      t.timestamps(null:false)
    end
  end
end
