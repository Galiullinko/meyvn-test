# == Schema Information
#
# Table name: filters
#
#  id         :bigint(8)        not null, primary key
#  params     :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_filters_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
# Filter's class
class Filter < ApplicationRecord
  belongs_to :user

  def events
    Event.filter(params.slice(:location, :period, :topics))
  end

  private

  def recipients

  end

  def create_notifications
    recipients.each do |recipient|
      Notification.create(recipient: recipient, actor: nil,
        action: 'new event created', notifiable: self)
    end
  end
end
