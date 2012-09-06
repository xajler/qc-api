class Unit < ActiveRecord::Base

  default_scope order(:name)

  belongs_to :tenant
  belongs_to :parent, class_name: 'Unit'
  has_many :children, class_name: 'Unit', foreign_key: 'parent_id'

  attr_accessible :active, :description, :name, :not_deleted, :parent_id
  attr_reader :units_lookup

  validates :name, presence: true

  def initialize(attributes = nil, options = {})
    super
    set_default
    set_units_lookup
  end

  def set_units_lookup
    @units_lookup = Hash.new

    units = Unit.where(active: true, not_deleted: true).order(:name).all

    units.each do |unit|
      @units_lookup[unit.id] = unit.name
    end
  end

  private

  def set_default
    self.active = true
    self.not_deleted = true
    self.parent_id = nil
  end
end
