# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  email      :string
#  address    :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base
  has_one :booking
  has_one :slot
  accepts_nested_attributes_for :slot
end
