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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
