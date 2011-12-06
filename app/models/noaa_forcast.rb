# == Schema Information
#
# Table name: noaa_forcasts
#
#  id                :integer         not null, primary key
#  observation_time  :string(255)
#  weather           :string(255)
#  temp_f            :string(255)
#  relative_humidity :string(255)
#  wind_dir          :string(255)
#  wind_degrees      :string(255)
#  wind_mph          :string(255)
#  wind_gust_mph     :string(255)
#  pressure_mb       :string(255)
#  dewpoint_f        :string(255)
#  windchill_f       :string(255)
#  visibility_mi     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  noaa_location_id  :integer
#

class NoaaForcast < ActiveRecord::Base
end
