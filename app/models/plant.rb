class Plant < ActiveRecord::Base
  has_many :users, through: :user_plants
  has_many :user_plants
  has_many :power_logs
end
