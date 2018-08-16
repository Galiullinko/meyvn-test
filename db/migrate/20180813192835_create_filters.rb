class CreateFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :filters do |t|
      t.references :user, foreign_key: true
      t.json :params

      t.timestamps
    end
  end
end
