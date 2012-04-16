# == Schema Information
#
# Table name: victims
#
#  id           :integer         not null, primary key
#  phone_number :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Victim < ActiveRecord::Base
end
