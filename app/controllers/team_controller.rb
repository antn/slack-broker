class TeamController < ApplicationController
  before_action :set_uuid

  def invite
    invite = SlackAPI.invite(params[:email], @token.token)
    render json: invite
  end

  def info
    info = SlackAPI.info(@token.token)
    render json: info
  end

  private
    def set_uuid
      token = Token.find_by_uuid params[:uuid]
      if token
        @token = token
      else
        render json: { ok: false, error: "invalid_uuid" }, status: 401
      end
    end
end
