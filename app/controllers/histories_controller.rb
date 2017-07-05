class HistoriesController < ApplicationController
   def create
    @proposal = Proposal.find(params[:proposal_id])
    @history = @proposal.histories.create(history_params)
    @history.user_id = current_user.id
    if @history.save
      redirect_to proposal_path(@history.proposal_id)
    else
      flash.now[:danger] = "History was not correctly saved!"
    end
  end
 
 def destroy
    @proposal = Proposal.find(params[:proposal_id])
    @history = @proposal.histories.find(params[:id])
    @history.destroy
    redirect_to proposal_path(@proposal)
  end

  private
    def history_params
      params.require(:history).permit(:note, :contacted)
    end
end
