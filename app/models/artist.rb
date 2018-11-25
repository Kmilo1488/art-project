# == Schema Information
#
# Table name: artists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  review     :string
#  country    :string
#  region     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord

  enum region: [:latin_america, :north_america, :europe, :asia, :africa]

  has_many :arts, foreign_key: :artist_id, class_name: "Art"

end
