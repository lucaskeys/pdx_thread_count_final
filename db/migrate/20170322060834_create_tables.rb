class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.text :about
      t.attachment :store_image
      t.string :street_address
      t.string :zip
      t.string :phone
      t.timestamps
    end

    create_table :articles do |t|
      t.string :author
      t.string :title
      t.text :content
      t.attachment :article_image
      t.integer :tag_id
      t.timestamps
    end

    create_table :article_stores do |t|
      t.integer :store_id
      t.integer :article_id
      t.timestamps
    end

    create_table :tags do |t|
      t.string :tag_name
      t.timestamps
    end

    create_table :designers do |t|
      t.string :designer_name
      t.text :about
      t.attachment :designer_image
      t.timestamps
    end

    create_table :designer_stores do |t|
      t.integer :store_id
      t.integer :designer_id
    end

    create_table :reviews do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :title
      t.text :body
      t.timestamps
    end

    create_table :store_announcements do |t|
      t.string :title
      t.text :description
      t.integer :store_id
      t.attachment :announcement_image
      t.timestamps
    end

    create_table :user_stores do |t|
      t.integer :store_id
      t.integer :user_id
      t.timestamps
    end

    create_table :posts do |t|
      t.integer :title
      t.text :content
      t.integer :user_id
      t.integer :topic_id
      t.attachment :post_image
      t.timestamps
    end

    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :content
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :topics do |t|
      t.string :topic_name
      t.timestamps
    end
  end
end
