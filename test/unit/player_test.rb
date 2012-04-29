# == Schema Information
#
# Table name: players
#
#  id         :integer         not null, primary key
#  steam_id   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  avatar     :string(255)
#  bit_column :integer(8)
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
