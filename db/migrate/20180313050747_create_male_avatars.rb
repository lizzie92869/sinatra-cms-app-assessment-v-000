class CreateMaleAvatars < ActiveRecord::Migration
  def change
  	create_table :male_avatars do |t|
  		t.string :eyes
  		t.string :accessory
  	end
  end
end
