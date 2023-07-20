class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.belongs_to :user
      t.text :corporator_authors
      t.string :title
      t.string :journal_name
      t.date :release_date
      t.string :volume
      t.string :issue

      t.timestamps
    end
  end
end
