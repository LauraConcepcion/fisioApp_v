class CreatePacientes < ActiveRecord::Migration
  def self.up
    create_table :pacientes do |t|
      t.string :name
      t.string :firstsurname
      t.string :secondsurname
      t.integer :idtype
      t.string :idcode
      t.string :profession
      t.integer :feetype_id
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :pacientes
  end
end
