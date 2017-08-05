class PaperTrailMessagesController < ApplicationController
  expose(
    :paper_trail_messages,
    -> { PaperTrail::Version.order(created_at: :desc).page params[:page] }
  )
end
