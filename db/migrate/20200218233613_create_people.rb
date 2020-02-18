class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birth_year
      t.string :homeworld
      t.array :starships

      t.timestamps
    end
  end
end
