class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :genre
      t.date :published_at

      t.timestamps
    end
  end
end
