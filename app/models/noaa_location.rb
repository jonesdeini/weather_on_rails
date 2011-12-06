# == Schema Information
#
# Table name: noaa_locations
#
#  id           :integer         not null, primary key
#  station_id   :string(255)
#  state        :string(255)
#  station_name :string(255)
#  latitude     :string(255)
#  longitude    :string(255)
#  xml_url      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class NoaaLocation < ActiveRecord::Base
  has_many :noaa_forcasts
end
