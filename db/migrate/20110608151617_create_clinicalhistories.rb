class CreateClinicalhistories < ActiveRecord::Migration
  def self.up
    create_table :clinicalhistories do |t|
      t.date :assessmentdate
      t.text :medicalhistory
      t.text :reasonconsultation
      t.text :evaluation
      t.text :treatment
      t.string :medicaldiagnosic
      t.text :physiotherapistdiagnostic
      t.date :startdatetto
      t.date :enddatetto
      t.integer :nsessions
      t.integer :frequency
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :clinicalhistories
  end
end
