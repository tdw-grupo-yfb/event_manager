require 'oauth'

class Twitter_consumer

	# Intercambia tu oauth_token y oauth_token_secret por un instancia AccessToken.
	def prepare_access_token(oauth_token, oauth_token_secret)
		consumer = OAuth::Consumer.new("rdtcwLFT4d8go6U76Lyw", "wHJOF5h141IJQmYNABb7QwZyFWcDmnDcEbnuLZ0xGM",
		{ :site => "http://admin-eventos.herokuapp.com",
	      :scheme => :header
	    })

	  # Crea el objeto AccessToken desde los valores enviados
	  token_hash = { :oauth_token => oauth_token,
	                 :oauth_token_secret => oauth_token_secret
	               }

	  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
	  return access_token
	end
end

# Access token : 551535495-yKBdRSm23icSrEINfdmh1QH7Qg4ClDbnnmO0oJMc
# Access token secret : qSixgT3Ejk3Cex9w4KDIl6gDm6YK7csxBa3AHnU

# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
#access_token = prepare_access_token("abcdefg", "hijklmnop")

# use the access token as an agent to get the home timeline
#response = access_token.request(:get, "http://api.twitter.com/1/statuses/home_timeline.json")