class CreatePeopleVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :people_vehicles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
    end
  end
end
