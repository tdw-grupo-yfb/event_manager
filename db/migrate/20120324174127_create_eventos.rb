class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.string :descripcion
      t.string :tipo
      t.string :categoria
      t.date :fechai
      t.date :fechaf
      t.string :estado
      t.integer :visitas

      t.timestamps
    end
  end
end
