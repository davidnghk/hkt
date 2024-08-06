module Api
  module V1
    class ReadingsController < ApplicationController
      skip_before_action :authenticate_user, only: [:create], raise: false
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        respond_with Reading.order("id DESC").all
      end

      def show
        respond_with Reading.find(params[:id])
      end

      def create
        #byebug
        respond_with Reading.create(reading_params)
        # respond_with Reading.create(params[:reading])
        #@reading = Reading.new(reading_params)
        #@reading.save

      end

      def update
        respond_with Reading.update(params[:id], params[:reading])
      end

      def destroy
        respond_with Reading.destroy(params[:id])
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_reading
          @reading = Reading.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def reading_params
          params.require(:reading).permit(:thing, :reading_time, :content, :thing_id)
        end

    end
  end
end