class Plant < ActiveRecord::Base
  has_many :users, through: :user_plants
  has_many :user_plants
  has_many :power_logs

  before_create :set_uuid
  before_create :set_access_token

  include RandomString

  def set_uuid
    self.uuid = random_string(length: 15)
  end

  def set_access_token
    self.access_token = random_string(length: 40)
  end

end
