class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.references :category, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
