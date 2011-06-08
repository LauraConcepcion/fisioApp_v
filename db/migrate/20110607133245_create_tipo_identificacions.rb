class CreateTipoIdentificacions < ActiveRecord::Migration
  def self.up
    create_table :tipo_identificacions do |t|
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_identificacions
  end
end
