module Api
  module V1
    # EventSerializer
    class EventSerializer < Api::ApiSerializer
      attributes :id, :title, :start_at, :end_at, :topics
    end
  end
end
