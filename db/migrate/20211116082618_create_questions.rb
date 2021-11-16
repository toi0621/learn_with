class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :genre_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
