class AddEncryptedTokenIvToTokens < ActiveRecord::Migration[5.0]
  def change
    add_column :tokens, :encrypted_token_iv, :string
  end
end
