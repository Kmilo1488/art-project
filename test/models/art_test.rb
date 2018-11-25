# == Schema Information
#
# Table name: arts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  price       :decimal(, )
#  photo       :string
#  artist_id   :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ArtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
