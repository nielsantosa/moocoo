class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
