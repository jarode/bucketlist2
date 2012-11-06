class CreateBucketItems < ActiveRecord::Migration
  def change
    create_table :bucket_items do |t|
	  t.references :user
	  t.references :bucketlist

      t.timestamps
    end
  end
end
