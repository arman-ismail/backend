class CreateInitialSchema < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest
      t.timestamps
    end
    
    create_table :book_clubs do |t|
      t.string :name, null: false
      t.text :description
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
    
    create_table :book_club_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true
      t.timestamps
    end
    
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.timestamps
    end
    
    create_table :book_readings do |t|
      t.references :book_club, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
    
    create_table :book_summaries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :books, :isbn, unique: true
  end
end