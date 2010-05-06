class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :episode_id, :null => false
      t.string :name
      t.string :email
      t.text :content
      t.string :user_ip
      t.string :user_agent
      t.string :user_referrer
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
