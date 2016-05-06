#Author: "Yash Khatri"

module RPS
   
  class RockPaperScissors
      def initialize
        @round = 1
        @player_score = 0
        @monster_score =  0
        @ties = 0
      end 
      
      def play_game
        begin
            puts "What winning score do you choose? "
            winning_score=Integer(gets.chomp)           
            while @player_score < winning_score && @monster_score < winning_score             
                user = User.new()
                monster = Monster.new()  
                user_choice = user.user_input(@round)
                monster_choice = monster.monster_input()
                result = fight(user_choice, monster_choice)
                if result == 1
                  @player_score+=1
                elsif result == -1
                  @monster_score+=1
                else
                  @ties+=1
                end         
                
                puts "Round #{@round}: Your Score: #{@player_score} , Monster's score: #{@monster_score} And Ties: #{@ties}"
                @round+=1
            end
            return show_results(@player_score, @monster_score, @ties )   
            rescue 
                 puts("Illegal input. Declare winning score in a number.")   
                puts("Try Again.")
                self.play_game()
         end
            
          
      end
      
    def fight(weapon1, weapon2)
        result = Weapon.new.attack(weapon1, weapon2)  
        if result == 1
            puts "\nYour weapon #{weapon1.class.name} beats Monster's weapon #{weapon2.class.name}. You win the round!"
        elsif result == 0
            puts "\nYour weapon #{weapon1.class} is same as Monster's weapon #{weapon2.class}. It's a tie!"
        else 
            puts "\nMonster's weapon #{weapon2.class} beats Your weapon #{weapon1.class}. Monster wins the round!"       
        end
        return result
     end
     
    def show_results(player_score, monster_score, tie )
        puts "\nFinal Score:: Your score: #{player_score} , Monster's score: #{monster_score} , Ties: #{tie}"
        if player_score > monster_score
            puts "\n\tFinal Result: Congratulations!! You win the Fight. :) "
            return true
        elsif monster_score > player_score
            puts "\n\tFinal Result: Alas!! Monster wins the Fight. :( "    
            return false      
        end
     end
  end
  
  class Weapon
      def initialize
          return self.class.name
      end
      
      def attack(weapon1, weapon2)
          return weapon1.attack(weapon2)
      end
  end
  
  class Rock < Weapon
    def initialize
      @name = "rock"
      end
        
      def attack(other)
          return other.attack_by_rock(self)
      end
      
      def attack_by_rock(other)
          return 0
      end
  
      def attack_by_paper(other)
          return 1
      end
  
      def attack_by_scissor(other)
          return -1
      end
    end
  
  class Paper < Weapon
        def initialize
          @name = "paper"
        end
  
      def attack(other)
          return other.attack_by_paper(self)
      end
      
      def attack_by_rock(other)
          return -1
      end
  
      def attack_by_paper(other)
          return 0
      end
  
      def attack_by_scissor(other)
          return 1
      end
  end
  
  
  class Scissor < Weapon
      def initialize
          @name = "scissor"
      end
      
      def attack(other)
          return other.attack_by_scissor(self)
      end
      
      def attack_by_rock(other)
          return 1
      end
      
      def attack_by_paper(other)
          return -1
      end
      
      def attack_by_scissor(other)
          return 0
      end
  end
  
  class Monster
      def monster_input
          r_num = rand(1 .. 3)
          if r_num == 1
             puts "Monster chose Rock"
              return Rock.new()
          elsif r_num == 2
              puts "Monster chose Paper"
              return Paper.new()
          else
              puts "Monster chose Scissor"
              return Scissor.new()
          end
      end
  end
  
  class User
      def user_input(round)
          puts "\nRound #{round} : Choose rock (r), paper (p) or scissors (s):  "
          choice = gets.chomp.downcase
          if choice == "r" or choice == "rock"
              puts "You chose Rock"
              return Rock.new()
          elsif choice == "p" or choice == "paper"
              puts "You chose Paper"
              return Paper.new()
          elsif choice == "s" or choice == "scissor"
            puts "You chose Scissor"
              return Scissor.new()
          else
              puts "Invalid choice."
              user_input()
          end
      end
  end
  
end



