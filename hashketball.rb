# Write your code here!
require "pry" 

def game_hash
   {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
          "Alan Anderson":{
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1 
          },
          "Reggie Evans":{
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          "Brook Lopez":{
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee":{
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry":{
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien":{
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 
        },
        "Bismak Biyombo":{
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop":{
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon":{
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood":{
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |team, data|
   data.each do |players, value|
      if players =="players".to_sym
        value.each do |player, detail|
          if player == player_name.to_sym
             return detail[:points]
          end
        end 
      end
    end
  end
end

def shoe_size(player_name)
   game_hash.each do |team, data|
    data.each do |players, value|
      if players =="players".to_sym
        value.each do |player, detail|
          if player == player_name.to_sym
            return detail[:shoe]
          end
        end 
      end
    end
  end
end

def team_colors(team_title)
  game_hash.each do |team, data|
    if data.has_value?(team_title)
      return data[:colors]
    end
  end
end

def team_names
  result =[]
    game_hash.each do |team, data|
      data.each do |team_info, value|
        if team_info == "team_name".to_sym
         result.push(value)
        end
      end
    end
  result
end

def player_numbers(team_title)
 result =[]
  game_hash.each do |team, data|
    if data.has_value?(team_title)
      data.each do |team_info, value|
        if team_info == "players".to_sym
          value.each do |player, numb|
                result.push(numb[:number])
          end
        end
      end
    end
  end
  result
end

def player_stats(player_name)
  game_hash.each do |team, data|
    data.each do |team_info, value|
      if team_info == "players".to_sym
        value.each do |player, detail|
            if player == player_name.to_sym
              return detail
            end
          end
        end
    end
  end
end

#helper function 
#return the player's name with biggest shoes size
def biggest_shoe
  player_name= []
  game_hash.each do |team, data|
    data.each do |team_info, value|
      if team_info == "players".to_sym
        obj=value.max_by {|key, value| value[:shoe]}
        player_name<< obj.first
      end
    end
  end
  player_name.first
end
  
#helper function
#return the most rebound 
def most_rebound(player_name)
  game_hash.each do |team, data|
    data.each do |team_info, value|
      if team_info == "players".to_sym
        value.each do |player, detail|
            if player == player_name
              return detail[:rebounds]
            end
          end
        end
    end
  end
end
  
def big_shoe_rebounds
  player_with_biggest_shoe=biggest_shoe
  most_rebound(player_with_biggest_shoe)
end

def most_points_scored
    hash={}
    game_hash.each do |k, v|
      v.each do |player, detail|
        if player ==:players
          detail.each do |name, score|
            score.each do |d, t|
              if d == :points
                hash[name]=t
              end
            end
          end
        end
      end
    end
    hash.max_by {|name, numb| numb}[0].to_s
end

def winning_team
  team_score={}
  game_hash.each do |k, v|
    v.each do |p, d|
      if p == :players
        sum=0
        d.each {|info, detail| sum+=detail[:points]}
        team_score[v[:team_name]]=sum
      end
    end
  end
  team_score.max_by {|team, score| score}[0]
end

#helper function
#return the player's name with the longest name
def player_with_longest_name
  result={}
    game_hash.each do |k, v|
      v.each do| p, d|
      if p==:players
        d.each do |i, j|
          result[i]=i.length
         end
        end
      end
    end
    result.max_by {|name, len| len}[0].to_s
  end

#helper function
#return the player's name with most steals
def most_steals
  result={}
    game_hash.each do |k, v|
      v.each do| p, d|
      if p==:players
        d.each do |t, s|
         result[t]=s[:steals]
          end
        end
      end
    end 
  result.max_by {|name, steal| steal}[0]
end

def long_name_steals_a_ton?
  player_longest_name=player_with_longest_name
  player_most_steal=most_steals
  if player_longest_name.to_sym == player_most_steal
    return true
  end
end