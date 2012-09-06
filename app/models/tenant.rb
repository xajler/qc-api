class Tenant < ActiveRecord::Base

  has_many :units
  has_many :users

  attr_accessible :active, :address, :custom_name_for_template,
                  :custom_name_for_tenant, :custom_name_for_unit, 
                  :customer_code, :customer_id, :description, :email,
                  :main_contact, :name, :not_deleted, :phone

  attr_reader :license_expiry_date, :licenses_total, :licenses_used

  validates :name, presence: true

  def initialize(attributes = nil, options = {})
    super
    set_default
  end

  private

  def set_default
    self.active = true
    self.not_deleted = true
    self.license_expiry_date = nil
  end
end
