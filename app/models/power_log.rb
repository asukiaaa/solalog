class PowerLog < ActiveRecord::Base
  belongs_to :plant
  validates :watt, presence: true

  def fill_watt
    if ampere.present? and voltage.present?
      self.watt ||= ampere * voltage
    end
  end

  def fill_logged_at
    self.logged_at ||= Time.zone.now
  end

end
