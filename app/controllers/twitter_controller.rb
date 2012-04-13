require 'rubygems'
require 'oauth'

class TwitterController

	def tweetear(categoria,descripcionevento)

		Twitter.configure do |config|
			config.consumer_key = "rdtcwLFT4d8go6U76Lyw"
  			config.consumer_secret = "wHJOF5h141IJQmYNABb7QwZyFWcDmnDcEbnuLZ0xGM"
  			config.oauth_token = "551535495-yKBdRSm23icSrEINfdmh1QH7Qg4ClDbnnmO0oJMc"
  			config.oauth_token_secret = "qSixgT3Ejk3Cex9w4KDIl6gDm6YK7csxBa3AHnU"
		end

    	#@twt = Twitter.user(usuario).location
    	Twitter.update(descripcionevento)

	end

	# Intercambia tu oauth_token y oauth_token_secret por un instancia AccessToken.
	#def prepare_access_token(oauth_token, oauth_token_secret)
	#	consumer = OAuth::Consumer.new("rdtcwLFT4d8go6U76Lyw", "wHJOF5h141IJQmYNABb7QwZyFWcDmnDcEbnuLZ0xGM",
	#	{ :site => "http://api.twitter.com",
	#      :scheme => :header
	#    })

	  # Crea el objeto AccessToken desde los valores enviados
	#  token_hash = { :oauth_token => oauth_token,
	#                 :oauth_token_secret => oauth_token_secret
	#               }

	#  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

	  
	#  return access_token
end