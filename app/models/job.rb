class Job < ActiveRecord::Base
  attr_accessible :category_id, :city, :company_name, :company_url,
                  :country, :description, :instruction,
                  :postal_code, :region, :user_id, :title, :company_logo

  has_attached_file :company_logo,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates :company_name, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :instruction, :presence => true
  validates :category_id, :presence => true
  validates :company_logo, :presence => true

  belongs_to :user
  belongs_to :category
end
