class ChampionController < ApplicationController
	def index
		key1 = 'RGAPI-91cb05bc-76d3-46f1-bcdb-ffea08832129'
		key2 = 'RGAPI-b633a05e-8f92-4376-a914-84a530c8a71c'
		@url = 'https://na1.api.riotgames.com/lol/static-data/v3/champions?locale=en_US&dataById=false&api_key=' + key2
		@champ_data = nil 
		@response = nil
	end

	def rune_page
		@runes = 'dank'
	end
end
