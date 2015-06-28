class TokenController < ApplicationController
  def create
    token = Token.new(uuid: SecureRandom.uuid, token: params[:token])
    if token.save
      render json: { ok: true, uuid: "#{token.uuid}" }
    else
      render json: { ok: false, error: "invalid_request" }
    end
  end

  def destroy
    token = Token.find_by_uuid params[:uuid]
    if token
      token.destroy!
      render json: { ok: true, message: "token_destroyed" }
    else
      render json: { ok: false, error: "invalid_uuid" }, status: 401
    end
  end
end
