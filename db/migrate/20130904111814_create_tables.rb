class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, uniqueness: true
      t.string :password_digest
      t.timestamps
    end

    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.string :url
      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.text :text
      t.timestamps
    end

    create_table :post_votes do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.timestamps
    end

  end


end
