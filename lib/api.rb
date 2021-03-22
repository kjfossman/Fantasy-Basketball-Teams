class API

    def initialize
        @url = "https://www.balldontlie.io/api/v1/players"

        # "https://www.balldontlie.io/api/v1/players?page=#{var}&per_page=100"
    end

    def get_data
        total = []
        players = HTTParty.get(@url)
        total << players
        c = 2
        while c <= players["meta"]["total_pages"] do
            local = "https://www.balldontlie.io/api/v1/players?page=#{c}"
            more_players = HTTParty.get(local)
            total << more_players
            c += 1
        end
        
        binding.pry
    end
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
