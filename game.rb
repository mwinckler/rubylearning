puts "You find yourself in the middle of a dark forest during a dark night. Which way do you go, north (1) or south, (2)"
    
print "< "
decision1 = $stdin.gets.chomp

if decision1 == "1"
    puts "you walk along the path until you come across a massive bear. Do you attack with your knife (1) or run away? (2)"

    print "< "
    decision2 = $stdin.gets.chomp

    if decision2 == "1"
        puts "You manage to attack the bear successfully, causing it to run off into the night. You proceed on your way and get out of the forest. Congratulations!"
    elsif decision2 == "2" 
        puts "You start to run, but the bear sees you and runs you down. It begins to maul you. Will you try to fight with a knife (1) or squirm out of his deadly grasp? (2)"
    puts "< "
    decision3 = $stdin.gets.chomp

    if decision3 == "1"
        puts "You desperately try to fend off the bear with your knife, but you are overpowered and taken prisoner inside his cave, to be eaten later as dinner. Hard luck!"
    elsif decision3 == "2"
        puts "You bravely try to get out of the bears grip and just as the bear stands poised with his death blow, you get out and run off, leaving the befuddled bear with no dinner. Soon though, you come to a fork in the road. Do you go right (1) or left, (2)"

        puts "< "
        decision4 = $stdin.gets.chomp

    if decision4 == "1"
         puts "You walk for what seems like eternity, but eventually, you come to the fringes of the forest and are rescued by some patrolling soldiers. Congratulations!"
     elsif decision4 == "2" 
         puts "Your way becomes more and more filled with thorns until eventually, you pass out and faint on the roadside. The next thing you know, you are prisoner in the evile wizard's Tower. You failed."
    end

    elsif decision1 == "2"
        puts "You walk along the long and twisting path until you come across a sphinx, who says, 'if you answer my riddle correctly, you may pass, otherwise...'"
        puts "The riddle is this: 'How many seconds are there in a year?'"
        puts "Option 1: 12. Option 2: 31,556,953. Which option do you choose?"

        puts "< "
        decision5 = $stdin.gets.chomp

            if decision5 == "1"
                puts "The sphinx says: 'You are correct! There are twelve seconds in a year! (January 2, March 2, etc. etc.) Please, pass on! Congratualations!'"
            elsif decision5 == "2"
                puts "The sphinx says: 'hahahahahaha! You fell for my trap!!! Now then, you must DIE!!!!' What do you do? 1: Try to run away. 2: Try to reason with the sphinx."

                puts "< "
                decision6 = $stdin.gets.chomp
             
            if decision6 == "1"
              puts "You run and run and run until you are out of breath, but by this time you are safely out of the forest. Congratualations!"
            elsif decision6 == "2"
                puts "You try to reason with the sphinx, but you are quickly outwitted and befuddled, and the sphinx takes advantage of your weakened state and tears you into shreds. You failed."
            end
                else 
                    puts "Why aren't you cooperating?"
            end