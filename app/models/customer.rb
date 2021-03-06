class Customer < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone,  presence: true
    validates :phone, numericality: { only_integer: true }
    validates :phone, length: { is: 10}
    #validates_length_of :number, is: 10,  message: "Number must be 10 digit long" 
    validates :email, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :zip, numericality: { only_integer: true }
    has_many :orders, dependent: :delete_all
    has_many :services, through: :orders 
    has_many :assignments, dependent: :delete_all
    has_many :users, through: :assignments 
    has_many :locations, through: :locations#check
    geocoded_by :full_address
    #accepts_nested_attributes_for :orders
#   reverse_geocoded_by :latitude, :longitude
#   after_validation :reverse_geocode    
    def full_name
      "#{first_name} #{last_name}"
    end
    # def cust_address
    #   "#{street} #{city} #{state} #{zip}"
    # end 
    def full_address
      sub_address = [street, city, state].compact.join(', ')
      [sub_address, zip].compact.join(' ')
    end            
  end
  
 
  
