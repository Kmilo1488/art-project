# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  image      :text
#  text       :text
#  owner_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  belongs_to :owner, foreign_key: :owner_id, class_name: "User"

end
