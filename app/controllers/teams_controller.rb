class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :chat, :destroy, :switch]

  # GET /teams
  # GET /teams.json
  def index
    if current_user.SysAdmin?
      @teams = Team.all
    else
      @teams = current_user.teams 
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  def chat
    @messages = @team.messages.order(created_at: :desc).limit(100).reverse
    #@team_user = current_user.teams.find_by(team_id: @team.id)
    @member = current_user.members.find_by(team_id: @team.id)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.members.new(user: current_user, role: 2)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
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

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def switch
    set_active_team
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:code, :name, :local_name)
    end

    def set_active_team
      session[:team_id] = @team.id
    end
end
