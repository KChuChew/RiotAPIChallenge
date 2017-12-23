class ChampionController < ApplicationController
	def index
		@url = 'https://na1.api.riotgames.com/lol/static-data/v3/champions?locale=en_US&dataById=false&api_key=RGAPI-91cb05bc-76d3-46f1-bcdb-ffea08832129'
		@champ_data = nil 
		@response = nil
	end

	def champ_page

	end
end
