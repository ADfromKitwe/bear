class Customer < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  
  accepts_nested_attributes_for :projects, allow_destroy: true
  
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true, numericality: true, length: { is: 10} 
  
  def phonenum(phone)
    @custphone =  "("+phone.at(0..2)+")"  +
                  phone.at(3..5) +"-"+ 
                  phone.at(6..9) 
  end
  
end
