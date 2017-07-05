class HistoriesController < ApplicationController
   def create
    @proposal = Proposal.find(params[:proposal_id])
    @proposal = @proposal.histories.create(history_params)
    redirect_to proposal_path(@proposal.proposal_id)
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
