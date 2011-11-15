# == Schema Information
#
# Table name: locations
#
#  id         :integer         not null, primary key
#  zip        :integer
#  city       :string(255)
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
end
