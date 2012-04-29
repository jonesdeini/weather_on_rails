# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  image       :string(255)
#  defindex    :integer
#  float_value :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
end
