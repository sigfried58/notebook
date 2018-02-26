class Contact < ApplicationRecord

  # Validations
  validates_presence_of :kind

  belongs_to :kind #, optional: true
  has_one :address
  has_many :phones

  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: {minimum: 3 }
  validates :email, presence: true
end
