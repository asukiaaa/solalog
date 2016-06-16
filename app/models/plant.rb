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

  def power_logs_by_date
    self.power_logs.order(logged_at: :desc)
  end

end
