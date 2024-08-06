class Assignments::LinesController < LinesController
    before_action :load_lineable
  
    def destroy
        @line = Line.find(params[:id])
        @line.destroy
        respond_to do |format|
          format.html { redirect_to @lineable, notice: 'Line was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

    private
  
      def load_lineable
        @lineable = Assignment.find(params[:assignment_id])
      end

  end