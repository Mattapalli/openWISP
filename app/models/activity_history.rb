class ActivityHistory < ActiveRecord::Base
  belongs_to :hotspot

  default_scope order(:start_time)

  def as_json(options={})
    [ status, start_time.to_s ]
  end

  def self.older_than(time)
    where(:start_time => time.to_time..Time.now)
  end
end