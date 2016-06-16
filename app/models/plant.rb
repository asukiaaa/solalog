class Plant < ActiveRecord::Base
  has_many :users, through: :user_plants
  has_many :user_plants
  has_many :power_logs

  before_create :set_api_key

  include RandomString

  def set_api_key
    begin
      self.api_key ||= SecureRandom.base64
    end while Plant.exists?(api_key: self.api_key)
  end

end
