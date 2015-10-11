class CreateDpts < ActiveRecord::Migration
  def change
    create_table :dpts do |t|
      t.references	:subdistrict
      t.references	:village
      t.string :jml_tps
      t.string :jml_laki_laki
      t.string :jml_perempuan
      t.string :jml_laki_laki_perempuan
      t.timestamps
    end
  end
end
