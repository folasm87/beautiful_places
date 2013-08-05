# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
BeautifulPlaces::Application.config.secret_key_base = secure_token

#BeautifulPlaces::Application.config.secret_key_base = 'b5a51657723aab92a6ce89ed098fc76a5239c42646ee8a29f54272b88eaf13547d3bb0cf6c86904c06e30f37e39cd7368cd0ec592bd5e7bf04df7f2a56220b2f'
