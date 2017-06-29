class ProposalsController < ApplicationController
    before_action :require_login, except: [:new, :create]
 


  def index
    @proposals = Proposal.all  
  end

  def new
    @proposal = Proposal.new
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.valid?
      @proposal.save!
      redirect_to '/'
    else
      render 'errors'
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
   
    if @proposal.update(proposal_params)
      redirect_to @proposal
    else
      render 'edit'
    end
  end

  def show
   @proposal = Proposal.find(params[:id])
  end


  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
   
    redirect_to proposals_path
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path # halts request cycle
    end
  end

  def proposal_params
    params.require(:proposal).permit(:name, :email, :company, :website_url, :phone, :email, :address, :city, :state, :zip, :website_goals)
  end
end
