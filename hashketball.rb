require 'pry'
def game_hash
  hash = {
     :home => {
               :team_name => "Brooklyn Nets", 
               :colors => ["Black", "White"], 
               :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22,                                                               :rebounds => 12, :assists => 12, :steals => 3,                                                          :blocks => 1, :slam_dunks => 1                                                                    },
                            "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12,     
                                               :rebounds => 12, :assists => 12, :steals => 12, 
                                               :blocks => 12,:slam_dunks => 7},
                                               
                            "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17,     
                                               :rebounds => 19, :assists => 10, :steals => 3, 
                                               :blocks => 1,:slam_dunks => 15},
                                               
                            "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26,     
                                               :rebounds => 12, :assists => 6, :steals => 3, 
                                               :blocks => 8,:slam_dunks => 5},
                                               
                            "Jason Terry" => {:number => 31, :shoe => 15, :points => 19,     
                                               :rebounds => 2, :assists => 2, :steals => 4, 
                                               :blocks => 11,:slam_dunks => 1}
                }
              }, 
     :away => {
               :team_name => "Charlotte Hornets", 
               :colors => ["Turquoise", "Purple"], 
               :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10,     
                                              :rebounds => 1, :assists => 1, :steals => 2, 
                                              :blocks => 7,:slam_dunks => 2},
                                              
                            "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12,     
                                               :rebounds => 4, :assists => 7, :steals => 7, 
                                               :blocks => 15, :slam_dunks => 10},
                                               
                            "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24,     
                                               :rebounds => 12, :assists => 12, :steals => 4, 
                                               :blocks => 5,:slam_dunks => 5},
                                               
                            "Ben Gorden" =>{:number => 8, :shoe => 15, :points =>33,     
                                            :rebounds => 3, :assists => 2, :steals => 1, 
                                            :blocks => 1,:slam_dunks => 0},
                                               
                            "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6,     
                                               :rebounds => 12, :assists => 12, :steals => 22, 
                                               :blocks => 5,:slam_dunks => 12}
                 
               }}}
end


def num_points_scored(player_name)
   score = 0
 game_hash.collect do |home_or_away, team_info|
   team_info.collect do|info_type, info|
    if info_type == :players
      info.collect do |players, detail|
       if players == player_name
        score += detail[:points]
       end
      end
    end
   end
 end
 return score
end


def shoe_size(player_name)
   shoe_size = 0
 game_hash.collect do |home_or_away, team_info|
   team_info.collect do|info_type, info|
    if info_type == :players
      info.collect do |players, detail|
       if players == player_name
        shoe_size += detail[:shoe]
       end
      end
    end
   end
 end
 return shoe_size
end


def team_colors(team)
  
  game_hash.collect do |home_or_away, team_info|
    team_info.collect do |info_type, info|
     if info_type == :team_name
      if team_info[:team_name] == team
        return team_info[:colors]
      end
     end
    end
  end
  
end

def team_names
  names = []
  game_hash.collect do |home_or_away, team_info|
    team_info.collect do |info_type, info|
      if info_type == :team_name
        names << team_info[:team_name]
      end
    end
  end
  return names
end



def player_numbers(team_names)
	jersey_numbers = []
	game_hash.each do |location, team_info|

		if team_info[:team_name] == team_names
			team_info[:players].each do |player, player_info|
				
				player_info.each do |info, value|
					if info == :number 
						jersey_numbers << value
						end
				end
				end
			end
		end
	jersey_numbers
	end






=begin
def player_stats(player_name)
stats = {}
game_hash.collect do |home_or_away, team_info|
  team_info.collect do |info_type, info|
   if info_type == :players
    info.collect do |names, details|
     if names == player_name
       details.collect do |k, v|
        stats[k] = v
       end
     end
    end
   end
  end
end
stats
end
=end


def player_stats(player_name)
  stats = {}
  game_hash[:home][:players].collect do |names, details|
    if names == player_name
       details.collect do |k, v|
         stats[k] = v
       end
    end
  end
  
  game_hash[:away][:players].collect do |names, details|
    if names == player_name
      details.collect do |k, v|
         stats[k] = v
       end
    end
  end
  stats
end








def big_shoe_rebounds
 shoe = {}
 game_hash.collect do |home_or_away, team_info|
   team_info.collect do |info_type, info|
     if info_type == :players
     info.collect do |k,v|
       shoe[k] = v[:shoe]
     end
   end
   end
 end
 big_shoe = []
 shoe.collect {|player, shoe_size| big_shoe << shoe_size}

 game_hash.collect do |home_or_away, team_info|
   team_info.collect do |info_type, info|
    if info_type == :players
      info.collect do |k,v|
        if v[:shoe] ==  big_shoe.sort[-1]
          return v[:rebounds]
        end
      end
    end
   end
 end
end

