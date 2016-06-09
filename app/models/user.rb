class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :plants, through: :user_plants
  has_many :user_plants
end
