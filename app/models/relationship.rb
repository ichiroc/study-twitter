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

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User' # フォローしている人
  belongs_to :followed, class_name: 'User'  # フォローされてる人
end
