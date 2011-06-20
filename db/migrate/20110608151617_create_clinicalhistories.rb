class CreateClinicalhistories < ActiveRecord::Migration
  def self.up
    create_table :clinicalhistories do |t|
      t.date :assessmentdate
      t.string :medicalhistory
      t.string :reasonconsultation
      t.string :evaluation
      t.string :treatment
      t.string :medicaldiagnosic
      t.string :physiotherapistdiagnostic
      t.date :startdatetto
      t.date :enddatetto
      t.integer :nsessions
      t.integer :frequency
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :clinicalhistories
  end
end
