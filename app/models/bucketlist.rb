class Bucketlist < ActiveRecord::Base
  attr_accessible :content
  
  has_many :bucketitems, :class_name => 'BucketItem', foreign_key: "bucketlist_id"
  has_many :user, :through => :bucketitems
  

  
  default_scope order: 'bucketlists.created_at DESC'
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
