# == Schema Information
#
# Table name: arts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  price       :decimal(, )
#  photo       :string
#  owner_id    :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Art < ApplicationRecord

  belongs_to :owner, foreign_key: :owner_id, class_name: "User"

end
