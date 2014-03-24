class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone_number
      t.string :url
      t.string :county
      t.string :school_type
      t.string :grade_level
      t.string :rating
      t.boolean :is_religious

      t.timestamps
    end
  end
end
