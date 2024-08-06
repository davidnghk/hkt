class Teams::MembersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_team 

	def create
		member = @team.members.new(member_params)
		member.team = @team
		if member.save
			redirect_to @team, notice: "Success"
		else
			redirect_to @team, alert: "Failure"
		end
	end

	def edit
	end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end


	private

	def set_team
		@team = current_user.teams.find(params[:team_id])
	end

	def member_params
		params.require(:member).permit(:email)
	end
end