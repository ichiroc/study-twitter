# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#  description            :text
#  avatar                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses
  has_many :relationships_as_follower, class_name: 'Relationship', foreign_key: :follower_id
  has_many :relationships_as_followed, class_name: 'Relationship', foreign_key: :followed_id
  has_many :followings, through: :relationships_as_follower, source: :followed
  has_many :followers, through: :relationships_as_followed, source: :follower

  validates :name, uniqueness: true

  def to_param
    name
  end

  def timeline
    [followings, self].flatten.map(&:statuses).flatten.sort { |a, b| b.created_at <=> a.created_at }
  end
end
