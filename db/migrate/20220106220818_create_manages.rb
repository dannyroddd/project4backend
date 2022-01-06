class CreateManages < ActiveRecord::Migration[6.1]
  def change
    create_table :manages do |t|
      t.string :title
      t.text :description
      t.string :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
