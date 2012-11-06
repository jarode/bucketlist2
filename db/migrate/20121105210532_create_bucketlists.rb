class CreateBucketlists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :content

      t.timestamps
    end
	add_index :bucketlists,  :created_at
  end
end
