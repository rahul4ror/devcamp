class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: proc {|attr| attr['name'].blank?}

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_portfolio_title, -> {where(subtitle: "Ruby on Rails")}

  after_initialize :set_default_image

  def set_default_image
    self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
    self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
  end
end
