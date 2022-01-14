def location_check
    puts "#{$room}", "\n"
    puts %q{
       ----------------------------------------------------
      |                   |             |     |            |
      |                   |             |     /      4     |
      |                   |             |     |            |
      |                   /         2          ------------
      |                   \             |     |            |
      |                   |             |     /      5     |
      |                   |             |     |            |
      /         1          --------------------------------
      \                   |                   |            |
      |                   |                   /      6     |
      |                   /                   |            |
      |                   \         3          ------------
      |                   |                   |            |
      |                   |                   /      7     |
      |                   |                   |            |
       ----------------------------------------------------
       1. Foyer
       2. Branch door room
       3. Iron door room
       4. Dining room
       5. Cozy kitchen
       6. Walk-in fridge
       7. Root cellar
    }
  end
  
  def foyer
  
    #Checking to see if we've been here before
    if $foyer_visited == false
      puts %q{
    You find yourself standing in a grand foyer.
    To your left is a large mahogany door with a door handle made from a thick tree branch.
    To your right is another large mahogany door except this door has a heavy iron handle.
    }
    else
      puts %q{
    The door with the large branch handle is to your left.
    The door with the heavy iron handle is to your right.
    }
    end
  
    puts "Which room would you like to explore? The door on the [left] or the [right]?"
    print "> "
    choice = $stdin.gets.chomp
  
    if choice == "left"
      branch_door
    elsif choice == "right"
      iron_door
    elsif choice == "location"
      location_check
      foyer
    else
      puts "That is not an option."
      failed("You could not pick a door.")
    end
  
  end
  
  def iron_door
    $foyer_visited = true #Updating the global variable to indicate we've been here before.
    $room = "You are in the iron door room."
  
    if $iron_door_visited == false #Have we been here before?
        puts %q{
    You find yourself standing in a large, industrial kitchen.
    There are stainless steel counters running the length of the kitchen, with giant racks of pots and pans hanging above them.
    You begin to explore the kitchen.
    You see two doors. They both look very similar.
    "Maybe one is a walk-in fridge and one is a root cellar..." you think to yourself.
    }
    else
      puts %q{
    You are back at the two similar doors inside the large, industrial kitchen.
    The large walk-in fridge in on the left. The root cellar is on the right.
      }
    end
  
    puts "Would you like to explore the door on the [left], the door on the [right], or go back to the [foyer]?"
    print "> "
    choice = $stdin.gets.chomp
  
    if choice == "left"
      fridge
    elsif choice == "right"
      root_cellar
    elsif choice == "location"
      location_check
      iron_door
    else
      foyer
    end
  
  end
  
  def root_cellar
    $iron_door_visited = true
    $room = "You are in the root cellar."
    puts %q{
    You find yourself standing in a giant root cellar.
    You see vegetables all around you.
    Would you like to continue exploring?
    }
    print "> "
    explore = $stdin.gets.chomp
  
    if explore == "yes" || explore == "Yes" || explore == "y"
      puts %q{
    You find nothing but potatoes and carrots.
    You exit the root cellar.
      }
      iron_door
    elsif explore == "location"
      location_check
      root_cellar
    else
      puts %q{
    You exit the root cellar.
      }
      iron_door
    end
  
  end
  
  def fridge
    $iron_door_visited = true
    $room = "You are in the walk-in fridge."
    puts %q{
    You open the door on the left and find yourself in a giant walk-in fridge.
    Would you like to explore the fridge?
    }
    print "> "
    explore = $stdin.gets.chomp
  
    if explore == "yes" || explore == "Yes" || explore == "y"
      milk
    elsif explore == "location"
      location_check
      fridge
    else
      puts %q{
    You decide to leave the fridge.
    Oh no! The door closed and locked behind you!
    Thankfully you have your cell phone and call for help.
    You spend the next 20 minutes doing jumping jacks to stay warm.
      }
      failed("Once the door is opened you are so tired that you decide to go home.")
    end
  
  end
  
  def milk
    puts %q{
    You spot a old timey bottle of milk.
    Do you take the milk?
    }
    print "> "
    take_milk = $stdin.gets.chomp
  
    if take_milk == "yes" || take_milk == "Yes" || take_milk == "y"
      $milk = true
      exit_fridge
    elsif take_milk == "location"
      location_check
      milk
    else
      $milk = false
      exit_fridge
    end
  
  end
  
  def exit_fridge
    puts %q{
    You turn to exit the fridge and you see a child standing at the door.
    The child says, "I'll only let you pass if you play a short game with me!"
    Will you play a game with the child?
    }
    print "> "
    play_game = $stdin.gets.chomp
  
    if play_game == "yes" || play_game == "Yes" || play_game == "y"
      game
    elsif play_game == "location"
      location_check
      exit_fridge
    else
      puts %q{
    You tell the child you do not have time to play and to step aside.
    The child begins to cry.
      }
      failed("You're mean and you do not deserve milk and cookies!")
    end
  
  end
  
  #The riddle / puzzle requirement of the game.
  def game
    puts %q{
    The little child smiles.
    "Yay! Ok! I have one question for you..."
    "What kind of room can you eat?"
    }
    print "> "
    riddle_answer = $stdin.gets.chomp
  
    if riddle_answer == "mushroom"
      puts %q{
    The child laughs and says, "Yay! You got it right!"
    The child lets you pass and you exit the fridge.
      }
      iron_door
    elsif riddle_answer == "location"
      location_check
      game
    else
      puts %q{
    The child begins to cry and says, "No one understands my riddles..."
      }
      failed("Way to make a kid cry! Try harder next time.")
    end
  
  end
  
  def branch_door
    $foyer_visited = true
    $room = "You are in the branch door room."
  
    if $branch_door_visited == false
      puts %q{
    You find yourself standing in a large, cozy room surrounded by rustic furniture.
    On the far side of the room you see a short hallway, at the end of which are two doors.
    }
    else
      puts %q{
    You are back in the short hallway, facing the two doors.
      }
    end
  
    puts "Would you like to enter door [1], door [2] or go back to the [foyer]?"
    print "> "
    choice = $stdin.gets.chomp
  
    if choice == "door 1" || choice == "1"
      dining_room
    elsif choice == "door 2" || choice == "2"
      cozy_kitchen
    elsif choice == "foyer" || choice == "Foyer"
      foyer
    elsif choice == "location"
      location_check
      branch_door
    else
      puts "That is not an option."
      failed("You could not choose a door so you gave up and went home.")
    end
  
  end
  
  def dining_room
    $branch_door_visited = true
    $room = "You are in the dining room."
    puts %q{
    You open the door and find yourself standing in a large dining room.
    Would you like to search the room?
    }
    print "> "
    search = $stdin.gets.chomp
  
    if search == "yes" || search == "Yes" || search == "y"
      puts %q{
    You search the room.
    There is nothing here so you leave.
      }
      branch_door
    elsif search == "location"
      location_check
      dining_room
    else
      puts "You leave the room."
      branch_door
    end
  
  end
  
  def cozy_kitchen
    $branch_door_visited = true
    $room = "You are in the coziest kitchen."
  
    if $cozy_kitchen_visited == false
      puts %q{
    You open the second door and find yourself standing in the coziest kitchen imaginable.
    You notice flour on the counter along with a used mixing bowl and wooden spoon.
    There is a plate of cookies on the counter.
    A little old lady pops up from behind the counter.
    "Hello dear!" she says.
    "Did you bring the milk?"
    }
    else
      puts %q{
    The little old lady smiles at you as you walk into the kitchen.
    "Oh! You're back!"
    "Did you bring the milk?"
      }
    end
  
    #Checking to see if we have the required object
    if $milk == false
      puts %q{
    You do not have the milk.
    You tell the sweet, old lady, "I'm sorry. I have no milk."
    "Oh dear!" she says. "Well you'd better fetch the milk."
    "We can't have cookies without milk."
    You tell the old lady you'll be right back and set out to find the milk.
      }
      branch_door
    else
      puts %q{
    You have the milk!
    You proudly hand the milk over to the old lady.
    "Oh! That's wonderful dear!"
    "Now let's sit and have ourselves some milk and cookies."
      }
      win("Not only do you have milk and cookies but you also have earned the friendship of a sweet, old lady.")
    end
  
  end
  
  def win(why)
    puts why, "Congratulations!"
    exit(0)
  end
  
  def failed(why)
    puts why, "You have failed."
    exit(0)
  end
  
  #Setting all the global variables as we start the game.
  $milk = false
  $foyer_visited = false
  $cozy_kitchen_visited = false
  $branch_door_visited = false
  $iron_door_visited = false
  
  $room = "You are in the foyer."
  puts %q{
    Hello! My name is Oatmeal.
    Pleased to meet you!
    Would you like to play a game?
  }
  puts "\n"
  print "> "
  game_choice = $stdin.gets.chomp
  
  if game_choice == "yes" || game_choice == "Yes" || game_choice == "y"
    puts %q{
    Great!
    You can check your location at any prompt by typing "location".
    Let's begin...
    }
    foyer
  else
    puts "No games for ol' Oatmeal. Goodbye."
    exit(0)
  end