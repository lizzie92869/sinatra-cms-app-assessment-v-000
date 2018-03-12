class CreateAvatars < ActiveRecord::Migration
  def change
  	create_table :avatars do |t|
  		t.string :gender
  		t.string :eyes
  		t.string :hair
  		t.string :accessory
  	end
  end
end
