# == Schema Information
#
# Table name: forcasts
#
#  id                     :integer         not null, primary key
#  low                    :integer
#  high                   :integer
#  current                :integer
#  condition              :string(255)
#  current_condition      :string(255)
#  current_condition_code :integer
#  condition_code         :integer
#  date_of_forcast        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  location_id            :integer
#

class Forcast < ActiveRecord::Base
  belongs_to :locations
end
