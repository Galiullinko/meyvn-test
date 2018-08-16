# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  end_at     :datetime
#  location   :string
#  start_at   :datetime
#  title      :string
#  topics     :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Event's class
class Event < ApplicationRecord
  include Filterable

  after_create :create_filter_notifications

  scope :location, ->(location) { where(location: location) }
  scope :topics, ->(topics) { where(topics: topics) }
  scope :period, ->(period) { where(start_at: period[0]..period[1]) }

  def filters
    Filter.where('params @> ?', {location: location, topics: topics})
  end

  private

  def create_filter_notifications

  end
end
