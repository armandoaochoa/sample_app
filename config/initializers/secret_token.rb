# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# SampleApp::Application.config.secret_key_base = 'd290a0118cae0f1598eec7c750c9bdc052bfb13157122ff54f6c0c4d1c1475c1afcbbae8c46d24b4dc05203c3f8b4dce39eb4b5fe8d08ed67c69243367b32e8b'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use existing token.
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
	end
end

SampleApp::Application.config.secret_key_base = secure_token