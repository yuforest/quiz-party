class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.text :content
      t.string :name
      t.references :quiz, null: false, foreign_key: true
      t.timestamps
    end
  end
end
