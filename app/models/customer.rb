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
  has_one :booking, dependent: :destroy
  has_one :slot
  accepts_nested_attributes_for :slot


  validates_presence_of :name, message: 'Please provide your name'
  validates_presence_of :email, message: 'Please provide your email'
  validates_presence_of :phone, message: 'Please provide your phone number'
end
