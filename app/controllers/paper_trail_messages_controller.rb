class PaperTrailMessagesController < ApplicationController
  expose(
    :paper_trail_messages,
    -> { PaperTrail::Version.where.not(whodunnit: nil).order(created_at: :desc).page params[:page] }
  )
end
