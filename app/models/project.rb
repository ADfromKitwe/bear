class Project < ActiveRecord::Base
  
  belongs_to :customer
  has_many :materials, dependent: :destroy
  
  accepts_nested_attributes_for :materials, allow_destroy: true
  
  validates :details, presence: true
  validates :price, presence: true, numericality: true 
  
  def self.materialsprice(project)
    @materialsprice = project.materials.sum(:price)
  end
    
  def self.totalprice(project)
    @totalprice = project.materials.sum(:price) + project.price
  end
  
end
