class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :quiz, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
