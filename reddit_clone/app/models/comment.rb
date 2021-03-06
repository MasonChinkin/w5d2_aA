# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  content    :text
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    validates :user_id, :content, :post_id, presence: true
    validates :content, length: {minimum: 1}

    belongs_to :user
    belongs_to :post
end
