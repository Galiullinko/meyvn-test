module Api
  module V1
    # FilterSerializer
    class FilterSerializer < Api::ApiSerializer
      attributes :id, :params
    end
  end
end
