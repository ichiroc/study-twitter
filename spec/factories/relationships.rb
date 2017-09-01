# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_relationships_on_followed_id  (followed_id)
#  index_relationships_on_follower_id  (follower_id)
#

FactoryGirl.define do
  factory :relationship do
    follower_id 1
    followed_id 1
  end
end
