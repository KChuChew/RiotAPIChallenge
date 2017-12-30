require 'json'

class ChampionController < ApplicationController
	class << self 
		attr_accessor :CHAMPION_STATIC_DATA, :CHAMPION_RUNE_DATA, :champ_id, :num_champ, :total_num_champions
		attr_accessor :runes, :runes_styles
	end
	
	def get_champ_static_data
		key1 = 'RGAPI-1937462f-22d9-4d7b-85d9-b82765d2b73c'
		key2 = 'RGAPI-9cd40029-9515-4027-9b27-24d824124e4c'
		@url = 'https://na1.api.riotgames.com/lol/static-data/v3/champions?tags=image&locale=en_US&dataById=false&api_key=' + key2
		response = HTTParty.get(@url)
		#puts response
		self.class.CHAMPION_STATIC_DATA = response.parsed_response["data"]
		#puts self.class.CHAMPION_STATIC_DATA
		puts response.header

		#puts self.class.CHAMPION_STATIC_DATA["data"].size
		self.class.total_num_champions = self.get_num_champ()
		#puts @yolo
		return self.class.CHAMPION_STATIC_DATA
	end

	def get_data_for(champion)
		return self.class.CHAMPION_STATIC_DATA[champion]
	end

	def get_num_champ
		num_key = 'RGAPI-9cd40029-9515-4027-9b27-24d824124e4c'
		@num_url = 'https://na1.api.riotgames.com/lol/platform/v3/champions?api_key=' + num_key
		num_response = HTTParty.get(@num_url)
		#puts num_response
		#return num_response
		#puts self.class.CHAMPION_STATIC_DATA["data"].count
		puts num_response["champions"].count
		return num_response["champions"].count
	end

	def get_champ_rune_data(champion_id)
		ggkey = '36cecc2b9b2b8c380d1c56b403fc300a'
		@url_b = 'http://api.champion.gg/v2/champions/' + champion_id + '?elo=SILVER&limit=2&champData=hashes&api_key=' + ggkey
		#@champ_data_b = nil
		#puts @url_b
		@ggresponse = HTTParty.get(@url_b)
		self.class.CHAMPION_RUNE_DATA = @ggresponse.parsed_response[0]["hashes"]["runehash"]["highestWinrate"]["hash"]
		#puts @ggresponse
		return self.class.CHAMPION_RUNE_DATA
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
		#puts params[:format]
		#puts params[:id]
		@champ_id = params[:format]
		puts @champ_id

		#if self.class.CHAMPION_RUNE_DATA.nil? 
		puts "sending request rune data"
		@rune_data = self.get_champ_rune_data(@champ_id)
		#puts @rune_data.split('-')
		@rune_data = @rune_data.split('-')
		puts @rune_data
		#puts Dir.pwd
		if self.class.runes.nil?
			runes = File.read('new_runes.json')
			runes = JSON.parse(runes)
			puts runes
		end
		if self.class.runes_styles.nil?
			runes_styles = File.read('rune_styles.json')
			runes_styles = JSON.parse(runes_styles)
			puts runes_styles
		end	
		#else 
		#	puts "not sending request rune data"
		#	@rune_data = self.class.CHAMPION_RUNE_DATA
		#end

	end

	#def champgg
	#	ggkey = '36cecc2b9b2b8c380d1c56b403fc300a'
	#	@url_b = 'http://api.champion.gg/v2/champions?elo=BRONZE&champData=hashes&limit=1&api_key=' + ggkey
	#	@champ_data_b = nil
	#	@ggresponse = nil
	#end
end
