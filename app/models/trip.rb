class Trip < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :destination, 
                  :description,
                  :enddate, 
                  :purpose, 
                  :startdate, 
                  :title,
                  :picture

  has_attached_file :picture, { :styles => { :large => "400 x 300", :medium => "300 x 240", :thumb => "200 x 140"}, :default_url => "/images/:style/missing.png" }              

  belongs_to :user

  default_scope -> { order('created_at DESC') }
  validates :description, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
