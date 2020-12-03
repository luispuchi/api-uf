class CreateUfRents < ActiveRecord::Migration[6.0]
  def change
    create_table :uf_rents do |t|
      t.date :date
      t.float :uf

      t.timestamps
    end
  end
end
