class ChampionController < ApplicationController
	class << self 
		attr_accessor :CHAMPION_STATIC_DATA
	end

	def get_champ_static_data
		key1 = 'RGAPI-1937462f-22d9-4d7b-85d9-b82765d2b73c'
		key2 = 'RGAPI-b633a05e-8f92-4376-a914-84a530c8a71c'
		@url = 'https://na1.api.riotgames.com/lol/static-data/v3/champions?tags=image&locale=en_US&dataById=false&api_key=' + key1
		response = HTTParty.get(@url)
		self.class.CHAMPION_STATIC_DATA = response.parsed_response["data"]
		puts response.header
		return self.class.CHAMPION_STATIC_DATA
	end

	def get_data_for(champion)
		return self.class.CHAMPION_STATIC_DATA[champion]
	end

	def index
		if self.class.CHAMPION_STATIC_DATA.nil? 
			puts "sending request"
			@champ_data = self.get_champ_static_data()
		else 
			puts "not sending request"
			@champ_data = self.class.CHAMPION_STATIC_DATA
		end
	end

	def show 
		@champ_name = params[:id]
	end

	def champgg
		ggkey = '36cecc2b9b2b8c380d1c56b403fc300a'
		@url_b = 'http://api.champion.gg/v2/champions?elo=BRONZE&champData=hashes&limit=1&api_key=' + ggkey
		@champ_data_b = nil
		@ggresponse = nil
	end
end
