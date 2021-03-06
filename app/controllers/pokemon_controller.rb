class PokemonController < ApplicationController

  def index
  end

  def show

    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(response.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"]



    result = []
    types.each do |type|
      result << type["type"]["name"]
    end

    puts "===================================="
    puts "Printing out `ENV`"
    puts ENV
    puts "Printing out `request.env`"
    puts request.env
    puts "===================================="

    # added 'verify => false' to address issue where API key verification fails
    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=333a6831167247f3b7f9736d4c843622&q=pikachu&rating=g")



    body = JSON.parse(res.body)
    # gif_url = body["data"][0]["url"]
    gif_url = body["data"][0]["images"]["original"]["url"]

    @response = {"id" =>  id,"name" => name, "types" => result, "url" => gif_url}
    # render json: {"id": id,"name": name, "types": result, "url": gif_url}
  end
end
