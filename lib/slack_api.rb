class SlackAPI
  def self.status
    request = HTTParty.get("https://slack.com/api/api.test")
    request.code == 200 && request["ok"] == true ? "ok" : "error"
  end

  def self.invite(email, token)
    options = { query: { token: token, email: email } }
    request = HTTParty.post("https://slack.com/api/users.admin.invite", options)
    if request.code == 200 && request["ok"] == true
      { ok: true, message: "invite_sucessful" }
    else
      { ok: false, error: request["error"] }
    end
  end

  def self.info(token)
    options = { query: { token: token} }
    request = HTTParty.post("https://slack.com/api/team.info", options)
    request.to_json
  end
end
