class HomeController < ApplicationController
  
  def index
    if user_signed_in? && current_user.admin
      @job = Job.all
    else
      @job = Job.all.where(status: :published)
    end
  end
end
