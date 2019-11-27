
class Scene
    def enter()
        puts "This scene is not yet configured. Subclass it and implement enter()."
        exit(1)
    end
end

class Engine
    
    def initialize(scene_map)
        @scene_map = scene_map
    end
    
    def play()
        current_scene = @scene_map.opening_scene()
        last_scene = @scene_map.next_scene('Death')
        
        while current_scene != last_scene
            next_scene_name = current_scene.enter()
            current_scene = @scene_map.next_scene(next_scene_name)
        end
        
        current_scene.enter()
    end
end

class Death < Scene
    
    def enter()
        puts "You died."
    end
end

class ThroneRoom < Scene
    def enter()
        puts "You have the choice between being a space soldier or joining the Space Police."
        puts "If you want to be a space soldier, press 1."
        puts "If you want to join the Space Police, press 2."
        puts "If you want to die, press 3."
           choice1 = $stdin.gets.chomp
        if choice1 == "1"
            puts "OK, good luck!"
            return 'ShipDoor'
        elsif choice1 == "2"
            puts "Good luck!"
            return 'PatrolShip'
        elsif choice1 == "3"
            puts "You made a weird choice. Goodbye, I guess..."
            return 'Death'
        else 
            puts "Please don't try to break the game..."
            return 'Death'
        end
    end
end
class ShipDoor < Scene
    
    def enter()
        
        puts "You find yourself needing to enter"
        puts "your troop transport, but first you must"
        puts "enter the passcode on the keypad."
        puts "unfortunately, you forgot the password."
        puts "However, you do know that it is a 3-digit number."
        puts "Well, you have 10 tries before you are zapped by security"
        puts "so you might as well try! Please enter three numbers."
        code = rand(1..1000)
        puts "[keypad]> "
        guess = gets.to_i
        guesses = 0
        
        while guess != code and guesses < 10
            puts "ERROR: WRONG VALUE GIVEN PLEASE TRY AGAIN YOUR ANSWER WAS #{code - guess} AWAY"
            guesses += 1
            guess = gets.to_i
        end
        
        if guess == code
            puts "The door slides open and you enter the ship."
            return 'ShipCorridor'
        else
            puts "You fail and the security system electrocutes you."
            exit(1)
        end
    end
end
class ShipCorridor < Scene
    
    def enter()
        
        puts "You enter the ship, but see that your crewmates" 
        puts "have all been killed by the evil aliens of"
        puts "Zorgartotron-3000. A Zorgotroon-700 is standing"
        puts "in your way. What do you do? Shoot? Dodge? Talk?"
        
        choice2 = $stdin.gets.chomp
        if choice2 == "shoot"
            puts "You whip out your blaster and fry the aliens face."
            puts "But the sound of the blaster brings a bunch of aliens."
            puts "Do you exit the ship or fight the aliens? Exit or Fight?"
            
            choice3 = $stdin.gets.chomp
            if choice3 == "Exit"
                puts "You die. Goodbye."
                return 'Death'
                
            elsif choice3 == "Fight"
                puts "You fight your way to the hangar bay."    
                return 'HangarBay'
            else 
                puts "C'mon"
                return 'ShipCorridor'
            end
        elsif choice2 == "Dodge"
            puts "You attempt to dodge the deadly frappe rays"
            puts "that the alien shoots but eventually you"
            puts "run out of energy and are broadsided by"
            puts "the deadly lazer. Goodbye."
            return Death
        elsif choice2 == "Talk"
            puts "You attempt to talk to the alien, but"
            puts "you forgot that the Zorgotron-700 can"
            puts "not understand the Flokig43 dialect you speak."
            puts "He blasts your face off."
            return 'Death'
        else 
            puts "DO NOT BREAK THE GAME!"
            return 'ShipCorridor'
        end
    end
end
class HangarBay < Scene
    
    def enter()
        puts "You enter Hangar Bay 1138, full of FAF's (Fast Attack Fighters)"
        puts "Hiding behind FAF-98 is a Zorgotron-1000, aiming its deadly guns"
        puts "right at your neck. Do you attempt to pull a quick-draw,"
        puts "or dodge the deadly lasers? quick-draw or dodge?"
        
        choice4 = $stdin.gets.chomp
        if choice4 == "quick-draw"
            puts "You whip out your pocket-RPG-3000 Model 6500 and level it at the"
            puts "Zorgotron's metallic eyes. Before the alien has a chance to fire,"
            puts "you deploy the homing rocket. Now you need to guide it to its target."
            puts "The safety code for you to begin guiding it is a question:"
            puts "What is the address of the English Prime Minister's house?"
            puts "You have five tries."
            puts "Also use correct capitilization."
            answer2 = "10 Downing Street"
            player_answer = $stdin.gets.chomp
            tries = 0 
            
            while player_answer != answer2 and tries < 3 
                puts "NO PASSWORD HINT GIVEN"
                tries += 1
                player_answer = $stdin.gets.chomp
            end
            while player_answer != answer2 and tries < 4 
                puts "HINT: LOOK IT UP ON GOOGLE"
                tries += 1
                player_answer = $stdin.gets.chomp
            end
            if player_answer == answer2
                puts "Noice. The missile hits home! You get into the ship and blast into spaaaaaaaaaaaaaaaace! Congrats"
                return 'Spaace'
            elsif player_answer != answer2 and tries < 5
                puts "The rocket self detonates and kills you."
                return 'Death'
            else
                puts "..."
                return 'HangarBay'
            end        
        elsif choice4 == "dodge"
            puts "You attempt to dodge the fire that is being thrown at you,"
            puts "but the targeting systems in the Z1000 are to high-tech"
            puts "and you are blasted into what would have been the stratosphere"
            puts "were you but on Gorgotrof 3. Goodbye."
            return 'Death'
            
        else 
            puts "UGH. COME ON."
            return 'ShipCorridor'
        end
    end
end
class Spaace < Scene
    
    def enter()
        puts "After strapping in, you eject into space. Fortunately"
        puts "You had preliminary PTS (Pilot Training School) in SoldierSchool."
        puts "On your left rearview mirror, you see a Jiruk-391 Interceptor closing in on you."
        puts "Do you engage the ship or attempt to jump to VyboSpace? Engage or Jump?"
        choice9 = $stdin.gets.chomp
        if choice9 == "Engage"
            puts "you perform a sickening barrel roll, and throw up inside the ship."
            puts "Despite this, you are now on course to crash into the Jiruk-391."
            return 'SpaceBattle'
            
        elsif choice9 == "Jump"
            puts "You flip the button to jump, but the Jump Drive Computer is a old"
            puts "make and it needs to update before you jump. You frantically allow the"
            puts "update to go, but then realize that the 'update' was actually a virus planted"
            puts "In the system by the Zorgotroons. With a sickening audio effect, all your systems"
            puts "shut down and you are left dead in space. Five minutes later, you are blasted out of"
            puts "space by a Thop9 Space Torpedo."
            return 'Death'
            
        else
            puts "please."
            return 'Death'
        end
    end
end
class SpaceBattle < Scene
    
    def enter()
        puts "Do you pull up and engage in aerial battle or kamikaze the larger ship? Pull up or Kamikaze?"
        choice10 = $stdin.gets.chomp
        if choice10 == "Pull up"
            puts "You attempt another aerial attempt, but the G's are to much. You pass out and die."
            return 'Death' 
        elsif choice10 == "Kamikaze"
            puts "You resign yourself and lock on to the frigate."
            puts "As you get closer, you suddenly realize the markings."
            puts "It is not a Jiruk-391! It is an Allied Freight Gort Barge!"
            puts "But you have already locked in. Do you try to override the system"
            puts "Or eject from the doomed ship? Override or Eject?"
        else 
            puts "..."
            return 'Death'
        end 
        choice11 = $stdin.gets.chomp
        
        if choice11 == "Override"
            puts "You frantically try to override the system, but you forgot the login"
            puts "Password to the computer. You crash into the ship, die, and cause a "
            puts "massive nuclear implosion, as the barge had been carrying torpedo warheads."
            return 'Death'
        elsif choice11 == "Eject"
            puts "You must enter in the Personalized Login."
            puts "Please enter in the Psalm number that was preached on on November 24, 2019"
            
            answer = $stdin.gets.chomp
            
            if answer == "105"
                puts "Correct! Congrats!"
                return 'Victory'
            elsif answer != "105"
                puts "Wrong Wrong Wrong! We did not talk about #{answer}" 
                return 'Death'
            else 
                puts "?"
                return 'Death'
            end
        end
    end
end
class PatrolShip < Scene
    
    def enter()
        puts "You are in your Trogodon T76, patrolling"
        puts "the Gorgotrof Sector. All is peaceful until"
        puts "A buzzer rings on your Police Radar Radio Alert."
        puts "A voice crackles over the radio: 'This is the"
        puts "Chasmohoffian Ascendancy Ambassador of War Related Events."
        puts "The Chasmoffians are taking over this sector for economic advantage."
        puts "Please, do not resist or else you will be brought before King Hertotron."
        puts "Do you resist or submit? Resist or Submit?"
        
        choice5 = $stdin.gets.chomp
        
        if choice5 == "Submit"
            puts "You push the Transmit button and say"
            puts "'This is Patrol 539, submitting to your command."
            puts "You are then blasted out of existence by your fellow patrolman."
            puts "In your escape stasis pod model 456, you watch events unfold."
            puts "You were the only one who submitted, and the Chasmohoffians are"
            puts "soundly beaten. You are remembered always as the Coward who deserted his Country."
            return 'Death'
        elsif choice5 == "Resist"
            puts "Neither you nor your fellow Space Police submit. The Chasmohoffians begin their siege."
            puts "You volunteer to be part of GorgoSpecForce400, tasked with the mission of destroying the"
            puts "Chasmohoffian HQ Ship. You reach the ship, but need to hack into it."
            puts "The keypad has Two Factor Authentication, a old trick invented thousands of years ago on Old Terra."
            puts "You must hack into it. It has two numbers that you must guess. 10 tries. Good luck."
            code = rand(1..1000)
            puts "[keypad]> "
            guess = gets.to_i
            guesses = 0
            
            while guess != code and guesses < 10
                puts "ERROR: WRONG VALUE GIVEN PLEASE TRY AGAIN YOUR GUESS WAS #{guess - code} AWAY FROM THE REAL ANSWER."
                guesses += 1
                guess = gets.to_i
            end
            
            if guess == code
                puts "The door slides open and your team enters the ship."
                return 'AlienHQ'
                
            else
                puts "You fail and you and your team are eliminated by the aliens."
                return 'Death'
            end
        else 
            puts "Try again."
            return 'PatrolShip'
        end
    end
end
class AlienHQ < Scene
    
    def enter()
        puts "You and your team quietly enter the ship, but as you step into a side door, the rest of the team is"
        puts "blown up by a SecuroRPGLauncher affixed to a nearby wall."
        puts "Your mission: To get into the munitions room, light the fuse, and get out."
        puts "Good Luck."
        puts "You come to a fork in your path. Do you go right or left? Right or Left?"
        
        choice6 = $stdin.gets.chomp
        
        if choice6 == "Right"
            puts "You enter the Throne Room of the Supreme Gorotron 8000."
            puts "You are taken prisoner and die the next day due to torture."
            return 'Death'
        elsif choice6 == "Left"
            puts "You run along a corridor and reach a door with a big explosion symbol. Do you enter? Yes or No?"
            
            choice7 = $stdin.gets.chomp
            
            if choice7 == "Yes"
                puts "You dare to enter, but you are vaporized by a Fogortroy Robot Guard."
                return Death
            elsif choice7 == "No"
                puts "You decide that it is to dangerous to enter and run along the corridor to find the real munitions depot."
                return 'CorridorRun'
            else "please."
                return 'Death'
            end
        else 
            puts "Try Again."
            return 'AlienHQ'   
        end
    end
end
class CorridorRun < Scene
    
    def enter()
        puts "You find the whole alien invasion army waiting for you. Do you Fight or Run? Fight or Run?"
        
        choice8 = $stdin.gets.chomp
        
        if choice8 == "Fight"
            puts "You engage in a fierce firefight with the army, but you are ridiculously outnumbered and overpowered."
            return 'Death'
        elsif choice8 == "Run"
            puts "You run through the surprised right flank and make it through to the munitions room"
            return 'MunitionRoom'
        end
    end
end
class MunitionRoom < Scene
    
    def enter()
        puts "This is it. To activate the fuse, you need to enter a 3 digit authoriztion number."
        puts "Here we go."
        puts "Oh and did I mention you only have 5 tries."
        number = rand(1..1000) 
        guess2 = gets.to_i
        guesses2 = 0
        
        while guess2 != number and guesses2 < 5
            puts "GOTBLOG USHO SOFORONIA TROK BLOG BLOV"
            guesses2 += 1
            guess2 = gets.to_i
            if guess2 = number 
                puts "The clock is ticking. Get out."
                return 'Final'
            else 
                puts "Nope."
                return 'Death'
            end
        end
    end
end
class Final < Scene
    
    def enter()
        puts "This. Is. It. The. Clock. Is. Ticking."
        puts "Get. Out. Of. Here."
        puts "You encounter the Supreme Potentate, who tells you this"
        puts "'If you tell me what we talked about last week in Ruby'"
        puts "Office Hours, I will let you pass. Otherwise..."
        puts "What did we talk about?"
        puts "Please use correct capitalization, by the way."
        
        answer = $stdin.gets.chomp
        
        if answer == "Github"
            puts "Correct! Congrats!"
            return 'Victory'
        elsif answer != "Github"
            puts "Wrong Wrong Wrong! We did not talk about #{answer}" 
            return 'Death'
        else 
            puts "?"
            return 'Death'
        end
    end
end        
class Victory < Scene
    
    def enter()
        puts "Congrats you won"
    end
end
class Map
    @@scenes = {
        'ThroneRoom' => ThroneRoom.new(),
        'ShipDoor' => ShipDoor.new(),
        'ShipCorridor' => ShipCorridor.new(),
        'HangarBay' => HangarBay.new(),
        'Death' => Death.new(),
        'PatrolShip' => PatrolShip.new(),
        'AlienHQ' => AlienHQ.new(),
        'CorridorRun' => CorridorRun.new(),
        'MunitionRoom' => MunitionRoom.new(),
        'Final' => Final.new(),
        'Victory' => Victory.new(),
        'Spaace' => Spaace.new(),
        'SpaceBattle' => SpaceBattle.new(),
        
    }
    
    
    def initialize(start_scene)
        @start_scene = start_scene
    end
    
    
    def next_scene(scene_name)
        val = @@scenes[scene_name]
        return val
    end
    
    def opening_scene()
        return next_scene(@start_scene)
    end
end
a_map = Map.new('ThroneRoom')
a_game = Engine.new(a_map)
a_game.play()


# This is code I am working on that will replace a test.
# favorite_word = $stdin.gets.chomp
# answer =  
# if answer == favorite_word
# if favorite_word include "e"
#     puts "You get out successfully. Congrats."
#    return 'Victory'
#  elsif favorite_word include ! "e"
#      puts "You do not make it."
#       return 'Death'
#   else
#       puts "Try again."