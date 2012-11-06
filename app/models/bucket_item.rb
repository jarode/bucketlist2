class BucketItem < ActiveRecord::Base
  attr_accessible :user_id, :bucketlist_id
  
  belongs_to :user
  belongs_to :bucketlist
end
