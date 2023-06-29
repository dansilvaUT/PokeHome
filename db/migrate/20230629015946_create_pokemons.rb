class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.integer :dex_id
      t.string :name
      t.json :moves
      t.json :images

      t.timestamps
    end
  end
end
