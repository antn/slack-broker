class DebugController < ApplicationController
  def empty
    render nothing: true
  end

  def ping
    ping = { app: "slack-broker", status: "ok", api_status: SlackAPI.status, now: Time.now.to_i }
    render json: ping
  end
end
