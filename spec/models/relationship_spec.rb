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

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
