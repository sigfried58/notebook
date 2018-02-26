class Contact < ApplicationRecord
  belongs_to :kind
  has_one :address
  has_many :phones

  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
