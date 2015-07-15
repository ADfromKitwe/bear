class Material < ActiveRecord::Base
  belongs_to :project
  
  validates :item, presence: true
  validates :description, presence: true, length:{ minimum: 10}
  validates :price, presence: true, numericality: true, length:{maximum: 6}
  

  
end
