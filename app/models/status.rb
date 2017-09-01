# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_statuses_on_user_id  (user_id)
#

class Status < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true
end
