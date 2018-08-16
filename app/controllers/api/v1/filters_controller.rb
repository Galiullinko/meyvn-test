module Api
  module V1
    # Controller for filters
    class FiltersController < ApplicationController
      before_action :authenticate_user!

      expose :filters, -> { current_user.filters }
      expose :filter, build_params: :filter_param

      # GET /api/v1/filters
      def index
        render json: filters, status: 200
      end

      # GET /api/v1/filters/1
      def show
        render json: filter, status: 200
      end

      # POST /api/v1/filters
      def create
        if filter.save
          render json: filter, status: 201
        else
          render json: filter.errors, status: 422
        end
      end

      # PATCH /api/v1/filters/1
      def update
        if filter.update(filter_params)
          render json: filter
        else
          render json: filter.errors, status: 422
        end
      end

      # DELETE /api/v1/filters/1
      def destroy
        @filter.destroy
      end

      private

      def filter_params
        params.require(:filter).permit(:params)
      end
    end
  end
end
