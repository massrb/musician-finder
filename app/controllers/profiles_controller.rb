class ProfilesController < ApplicationController
  def show
  end

  def index
    @instruments = ['drums', 'vocals', 'bass']
    
    # Apply filter if instrument is selected
    if params[:instrument].present?
      @profiles = Profile.where(instrument: params[:instrument])
    else
      @profiles = Profile.all
    end
  end

  def destroy
  end
end
