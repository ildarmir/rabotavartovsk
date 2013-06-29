class Session < ActiveRecord::Base
  def self.sweep(time = 180)
    delete_all "updated_at < '#{time.minutes.ago.to_s(:db)}' OR
    created_at < '#{7.days.ago.to_s(:db)}'"
  end
end
