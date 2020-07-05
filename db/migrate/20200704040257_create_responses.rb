class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.text :content
      t.references :quiz, null: false, foreign_key: true
      t.boolean :is_correct, null: false, default: false
      t.timestamps
    end
  end
end
