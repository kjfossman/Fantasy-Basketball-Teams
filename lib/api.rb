# class API
#     def initialize
#     @url = "https://www.balldontlie.io/api/v1/teams"
#     teams = HTTParty.get(@url)
#     teams["data"].each do |x|
#         NbaTeam.create(abrreviation: x["abrreviation"], city: x["city"], conference: x["conference"], division: x["division"], full_name: x["full_name"], name: x["name"])
#     end
#     binding.pry
#     end
# end
#     counter = 0.0
#     percentage = 0
#  => 0.0 

#  array.each do |num|
     
#      system('clear')
#      counter += 1
#      percentage = counter/array.length*100.0
#      puts percentage
# end



#     # def create_trivia_objects(trivia_array)
#     #     # binding.pry
#     #     # trivia_array.each do |trivia_hash| 
#     #     #     Clue.new(trivia_hash) unless trivia_hash['question'] == ""   
#     #     # end
#     # end
# end





# def initialize
    #     @url = "https://www.balldontlie.io/api/v1/players"

    #     # "https://www.balldontlie.io/api/v1/players?page=#{var}&per_page=100"
    # end

    # def get_data
    #     total = []
    #     players = HTTParty.get(@url)
    #     total << players
    #     c = 2
    #     while c <= players["meta"]["total_pages"]  do
    #         local = "https://www.balldontlie.io/api/v1/players?page=#{c}"
    #         more_players = HTTParty.get(local)
    #         total << more_players
    #         c += 1
    #     end
    #     total.each do |x|
    #         x["data"].each do |y|
    #             user = Player.create(first_name: y["first_name"], last_name: y["last_name"], position: y["position"], nba_team_id: y["team"]["id"])
    #         end
    #     end
    # end