class User < ActiveRecord::Base

  belongs_to :tenant
  #belongs_to :recorder_player

  attr_accessible :active, :email, :first_name, :last_name, :not_deleted,
                  :recorder_account_id, :recorder_user_id, :username

  validates :username, presence: true

  def initialize(attributes = nil, options = {})
    super
    set_default
  end

  private

  def set_default
    self.active = true
    self.not_deleted = true
  end
end
