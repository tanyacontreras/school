class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :rating
      t.references :user, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
