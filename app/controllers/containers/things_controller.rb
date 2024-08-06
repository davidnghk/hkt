class Containers::ThingsController < ThingsController
    before_action :load_thingable
  
    def destroy
        @thing = Thing.find(params[:id])
        @thing.destroy

        respond_to do |format|
          format.html { redirect_to @thingable, notice: 'Thing was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

    private
  
      def load_thingable
        @thingable = Container.find(params[:container_id])
      end
  end