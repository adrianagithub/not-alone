class Service < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
    validates :description, presence: true
    validates :kind, presence: true
    validates :phone_number,  presence: true
    validates :phone_number, numericality: { only_integer: true }
    validates :phone_number, length: { is: 10}
    has_one_attached :picture
    has_many :orders, dependent: :delete_all
    has_many :customers, through: :orders
    has_many :locations, through: :locations#check
    geocoded_by :address
    after_validation :geocode, if: ->(obj) { obj.address.present? && obj.street_changed? }

  

   def address
    sub_address = [street, city, state].compact.join(', ')
    [sub_address, zip].compact.join(' ')
   end   
   
   def address_parsed
    self.to_json
   end
 
end
