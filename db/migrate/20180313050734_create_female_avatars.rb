class CreateFemaleAvatars < ActiveRecord::Migration
  def change
  	create_table :female_avatars do |t|
  		t.string :female_avatar_name
  		t.string :eyes
  		t.string :hair
  	end
  end
end
