class Token < ActiveRecord::Base
  validates :uuid, :encrypted_token, presence: true, uniqueness: true
  attr_encrypted :token, :key => Rails.application.secrets[:token_key]
end
