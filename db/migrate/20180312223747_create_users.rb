class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  	t.string  :username
    t.string  :email
    t.string  :password_digest
    t.integer :female_avatar_id
    t.integer :male_avatar_id
  	end
  end
end
