class TeamController < ApplicationController
  def invite
    token = Token.find_by_uuid params[:uuid]
    if token
      invite = SlackAPI.invite(params[:email], token.token)
      render json: invite
    else
      render json: { ok: false, error: "invalid_uuid" }, status: 401
    end
  end

  def info
    token = Token.find_by_uuid params[:uuid]
    if token
      info = SlackAPI.info(token.token)
      render json: info
    else
      render json: { ok: false, error: "invalid_uuid" }, status: 401
    end
  end
end