# == Schema Information
#
# Table name: posts
#
#  id      :bigint(8)        not null, primary key
#  title   :string           not null
#  url     :string
#  content :text
#  sub_id  :integer          not null
#  user_id :integer          not null
#

class Post < ApplicationRecord
    validates :title, :sub_id, :user_id, presence: true

    has_many :postsubs

    belongs_to :sub
    belongs_to :user
    has_many :comments
end
