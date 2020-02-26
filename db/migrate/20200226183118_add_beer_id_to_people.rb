class AddBeerIdToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :beer, null: false, foreign_key: true
  end
end
