class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
	  t.references	:subdistrict
      t.string	:name
      t.timestamps
    end
  end
end
