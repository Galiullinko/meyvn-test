module Api
  module V1
    # Controller for events
    class EventsController < ApplicationController
      expose :events, -> { Event.filter(filter_params) }
      expose :event, build_params: :event_params

      # GET /api/v1/events
      def index
        render json: events, status: 200
      end

      # GET /api/v1/events/1
      def show
        render json: event
      end

      # POST /api/v1/events
      def create
        if event.save
          render json: event, status: 201
        else
          render json: event.errors, status: 422
        end
      end

      # PATCH /api/v1/events/1
      def update
        if event.update(event_params)
          render json: event
        else
          render json: event.errors, status: 422
        end
      end

      # DELETE /api/v1/events/1
      def destroy
        event.destroy
      end

      private
        def event_params
          params.permit(:title, :start_at, :end_at, :location, topics: [])
        end

        def filter_params
          event_params.slice(:location, :period, :topics)
        end
    end
  end
end
