#Authors: "Yash Khatri, Sudipta Mallick Das and Martina Öqvist"
module MazeGame

  #Walls Class
  class Walls
    #initializing all the walls. The rooms will definitely have 
    #all four walls. Hence initializing all them to be true.
    def initialize
      @east_wall = true
      @west_wall = true
      @north_wall = true
      @south_wall = true
    end
    
    #This method is used for testing. Not significant for actual logic.
    def describeWalls
        puts "E#{@east_wall}--W#{@west_wall}--N#{@north_wall}--S#{@south_wall}"
    end
  
  end  #class walls ends
  
  #Doors class
  class Doors
    #initializing doors to be false.
    def initialize(east_door=false, west_door=false, north_door= false, south_door=false)
      @east_door = east_door
      @west_door = west_door
      @north_door = north_door
      @south_door = south_door
    end
    
    #setting the east door.
    def eastDoor=(east_door)
      @east_door = east_door
    end 
    
    #setting the west door.
    def westDoor=(west_door)
      @west_door = west_door
    end  
      
    #setting the north door.
    def northDoor=(north_door)
      @north_door = north_door
    end
    
    #setting the south door.
    def southDoor=(south_door)
      @south_door = south_door  
    end  
    
    #getting the east door.
    def hasEastDoor
      return @east_door
    end
    
    #getting the west door.
    def hasWestDoor
          return @west_door
    end
    
    #getting the north door.
    def hasNorthDoor
          return @north_door
    end
        
    #setting the south door.
    def hasSouthDoor
          return @south_door
    end
        
    #This method is used for testing. Not significant for actual logic.
    def describeDoors
            puts "E#{@east_door}--W#{@west_door}--N#{@north_door}--S#{@south_door}"
    end
  end  #ends Door

  #Treasure class
  class Treasure
    #initializing the treasure class as true
    def initialize(treasure = false)
      @treasure = true
    end
    
    #getting the treasure
    def hasTreasure
      return @treasure
    end
    
    #This method is used for testing. Not significant for actual logic.
    def describeTreasure
      puts "#{@treasure}"
    end
  end
  
  #monster class
  class Monster
    #intializing the monster and want to fight.
    def initialize(monster=false, wantToFight=false)
      @monster = monster
      @wantToFight = wantToFight
    end
    
    #getting the monster
    def hasMonster
      return @monster
    end
    
    #getting want o fight. This variable decides even if the
    #user wants to run but Monster want to fight or not.
    def wantToFight
      return @wantToFight
    end
    
    #This method is used for testing. Not significant for actual logic.
    def describeMonster
      puts "Monster->#{@monster}"
      puts "MonsterWantsToFight -->#{@wantToFight}"
    end
  end  #ends Monster

  #Item class This class contains the item (for eg. sword)
  #used for advanced RPS game but we haven't used advanced RPS game.
  class Item
    #initializing the Item
    def initialize(item=false)
      @item = item
    end
    
    #getting the item
    def hasItem
      return @item
    end
    
    #This method is used for testing. Not significant for actual logic.
    def describeItem
          puts "Item->#{@item}"
    end
  end #ends Item

  #Room class
  class Room
    #initializing the Room
    def initialize(name)
      @name = name
    end
    
    #setter for nameOfRoom.
    def nameOfRoom=(name)
      @name = name
    end
    
    #setting doors
    def doors=(roomDoors)
      @roomDoors = roomDoors   #door object with doors set as true or false
    end
    
    #setting walls
    def walls=(roomWalls)
      @roomWalls = roomWalls
    end
    
    #setting monster
    def monster=(roomMonster)
      @roomMonster = roomMonster
    end
    
    #setting item
    def item=(roomItem)
      @roomItem = roomItem
    end
    
    #setting treasure
    def treasure=(treasure)
      @roomTreasure = treasure
    end
    
    #getting name of Room.
    def getNameOfRoom
      return @name
    end
        
    #getting doors
    def getDoors
      return @roomDoors   #door object with doors set as true or false
    end
        
    #getting walls
    def getWalls
      return @roomWalls
    end
        
    #getting monster
    def getMonster
      return @roomMonster
    end
        
    #getting item
    def getItem
      return @roomItem
    end    
    
    #getting treasure
    def getTreasure
      return @roomTreasure
    end
   
    #This method is used for testing. Not significant for actual logic.
    def describeRoom
      puts "Name --> #{@name}"
      puts "Doors -->#{@roomDoors}."
      puts "Walls -->#{@roomWalls}"
      puts "Monster -->#{@roomMonster}"
      puts "Item -->#{@roomItem}"
      puts "Treasure --> #{@roomTreasure}"
    end
    
  end  #room end

  #Mazefactory class. This class is responsible for creating the maze.
  class MazeFactory
    #reseting doors
    def resetDoors
          @eDoor = false
          @wDoor = false
          @nDoor = false
          @sDoor = false
    end
    
    #making room
    def makeRoom(name)
      #creating room
      room = Room.new(name)
      #setting doors in room
      room.doors=(makeDoors())
      #setting monster in room
      room.monster=(makeMonster())
      #setting walls in room
      room.walls=(makeWalls())
      #setting item in room
      room.item=(makeItem())
      return room
    end
    
    #making doors
    def makeDoors
      #resting doors
      resetDoors
      arrayOfDoors = Array['E', 'W', 'N', 'S']
      noOfDoors = rand(1..4)
      #randomly selecting the doors to set.
      #can set 1 to 4 doors in a room.
      sampleArrayOfDoors = arrayOfDoors.sample(noOfDoors)
      
      if sampleArrayOfDoors.include?('E')
        @eDoor = true
      end
      if sampleArrayOfDoors.include?('W')
        @wDoor = true
      end
      if sampleArrayOfDoors.include?('N')
        @nDoor = true
      end
      if sampleArrayOfDoors.include?('S')
        @sDoor = true
      end
      
       door = Doors.new(@eDoor, @wDoor, @nDoor, @sDoor )
       return door
    end
    
    #making monster
    def makeMonster
      monstersPossibility = Array[true, false]
      #randomly selecting if the monster exists or not.
      monsterExists = monstersPossibility.sample(1)[0]
      fightPossibility = Array[true, false]
      wantToFight = false
      if monsterExists
        #if monster exists randomly selecting if monster wants to fight or not.
        wantToFight = fightPossibility.sample(1)[0]
      end  
      #creating monster object.
      monster = Monster.new(monsterExists,wantToFight)
      return monster
    end
    
    #making walls
    def makeWalls
      walls = Walls.new()
      return walls
    end
    
    #making Item
    def makeItem
      itemPossibility = Array[true, false]
      #randomly selecting if item exists or not.
      itemExists = itemPossibility.sample(1)[0]
      item = Item.new(itemExists)
      return item
    end
    
    #making maze
    def makeMaze(row, column)
      listOfRooms = {}
      for i in 1..row
        for j in 1..column
          keyString = "#{i}#{j}"
          key = Integer(keyString)
          #making rooms
          room = makeRoom("#{key}")
          #setting rooms in maze
          listOfRooms[key] = room
        end  
      end
      #Fixing the doors in the corner rooms.
      roomsWithFixedDoors = fixedDoors(row,column,listOfRooms)
      #checking if suppose room 1 and 2 are adjacent rooms room 1 have door to 
      #the E then, room 2 must have door to the W
      newRooms = checkDoors(roomsWithFixedDoors)
      #setting the treasure in one room.
      newRoomsWithTreasure = makeTreasure(newRooms)
      
      return newRoomsWithTreasure
    end
    
    #This method is responsible for checking if suppose room 1 and 2 
    #are adjacent rooms room 1 have door to the E then, room 2 must have door to the W
    # Rooms to the east and west have a difference of 1 in the index num.
    # suppose room's index is 22 then room in west to it
    #has index 23 room on north is 32 on the south is 12 on the east is 21
    def checkDoors(listOfRooms)
      listOfRooms.each do |key, room|
        if room.getDoors.hasEastDoor
          roomNameAtEast = Integer(room.getNameOfRoom) - 1
          if listOfRooms.has_key?(roomNameAtEast)
            listOfRooms[roomNameAtEast].getDoors.westDoor = true
          end
        end
        
        if room.getDoors.hasWestDoor
          roomNameAtWest = Integer(room.getNameOfRoom) + 1
          if listOfRooms.has_key?(roomNameAtWest)
            listOfRooms[roomNameAtWest].getDoors.eastDoor = true
          end
        end
        
        if room.getDoors.hasNorthDoor
          roomNameAtNorth = Integer(room.getNameOfRoom) + 10
          if listOfRooms.has_key?(roomNameAtNorth)
            listOfRooms[roomNameAtNorth].getDoors.southDoor = true
          end
        end

        if room.getDoors.hasSouthDoor
          roomNameAtSouth = Integer(room.getNameOfRoom) - 10
          if listOfRooms.has_key?(roomNameAtSouth)
            listOfRooms[roomNameAtSouth].getDoors.northDoor = true
          end
        end
        
      end
      return listOfRooms
    end  
    
    #fixing doors on corner rooms.
    def fixedDoors(row, column, listOfRooms)
      start = 1
      rbCornerString =  "#{start}#{column}"
      rbCorner = Integer(rbCornerString)
      lbCornerString = "#{start}#{start}"
      lbCorner = Integer(lbCornerString)
      ltCornerString = "#{row}#{start}"
      ltCorner = Integer(ltCornerString)
      rtCornerString = "#{row}#{start}"
      rtCorner = Integer(rtCornerString)

      listOfRooms[rbCorner].getDoors.eastDoor = true
      listOfRooms[lbCorner].getDoors.southDoor = true

      listOfRooms[ltCorner].getDoors.westDoor = true
      listOfRooms[rtCorner].getDoors.northDoor = true
      
      return listOfRooms
    end
    
    #making treasure
    def makeTreasure(listOfRooms)
      allKeys = listOfRooms.keys
      #randomly selecting a room 
      oneKey = allKeys.sample(1)
      treasure = Treasure.new(true)
      #setting treasure in the randomly selected room.
      listOfRooms[oneKey[0]].treasure=(treasure)
      return listOfRooms
    end
    
    #This method is used when describing the room. It shows the available
    #doors in the room
    def availableDoors(room)
      east_Door = room.getDoors.hasEastDoor
      west_Door = room.getDoors.hasWestDoor
      north_Door = room.getDoors.hasNorthDoor
      south_Door = room.getDoors.hasSouthDoor
      
      doors = []
      if east_Door 
         doors << "East"
      end
      if west_Door
         doors << "West"
      end
      if north_Door
         doors << "North"
      end
      if south_Door
         doors << "South"
      end
            
      puts "There are doors to the #{doors}"
    end
    
    
    #This method is used for presenting the room.
    def presentRoom(room)
      
      #showing doors
      availableDoors(room)
      
      #item?
      if room.getItem.hasItem
        puts "There is a Sword in room"
      else 
        puts "There are no items in room"
      end
      
      #treasure?
      if not room.getTreasure.nil?
        puts "There is a Treasure in the room"
      else
        puts "There is no Treasure in the room"
      end
      
      options = []
      options << "L"
      #monster ?
      if room.getMonster.hasMonster
        puts "There is a monster in room"
        options << "F"
      else 
        puts "There are no enemies"
        if not room.getTreasure.nil?
          return "L"
        end
      end
      
      return options
    end
    
    #This rooms is responsible for changing the current location of
    #user. Moving to different rooms
    def makeMove(currentRoom, doorsAvailable, currentLocation)
         puts "You wan to leave. Trough which door #{doorsAvailable}"
         direction_1 = gets.chomp
         direction = direction_1.capitalize.strip.chars.first
         puts direction
         cLoc = currentLocation
         if direction == "N"
           cLoc += 10
         elsif direction == "S"
           cLoc -= 10
         elsif direction == "E"
           cLoc += 1
         elsif direction == "W"
           cLoc -= 1
         end
         return cLoc
      end
    
    
end #makefactory ends

  #this class triggers the game.
  class PlayGame
    #importing RockPaperScissor module
    require "E:/WorkDirectoryForRuby/Week5/src/RPS.rb"
    #randomly selecting the rows in a maze.
    row = rand(1..4)
    #always making a square maze.
    column = row
    #setting a default currentLocation It is a garbage number.
    currentLocation = 998

    notWon = true
    
    start = 1
    rbCornerString =  "#{start}#{column}"
    rbCorner = Integer(rbCornerString)
    lbCornerString = "#{start}#{start}"
    lbCorner = Integer(lbCornerString)
    ltCornerString = "#{row}#{start}"
    ltCorner = Integer(ltCornerString)
    rtCornerString = "#{row}#{column}"
    rtCorner = Integer(rtCornerString)
    
    #making maze with random rooms
    maze = MazeFactory.new()
    rooms = maze.makeMaze(row,column)
    insideMaze = false
    
    while notWon do 
      if not insideMaze
        puts "Through which gate do you want to enter the maze? (N, E, S, W):"
        entryGateIP = gets.chomp
        entryGate = entryGateIP.to_s
        if entryGate == "S"
            currentLocation = lbCorner
            insideMaze = true
        elsif entryGate == "N"
            currentLocation = rtCorner 
            insideMaze = true
        elsif entryGate == "E"
            currentLocation = rbCorner
            insideMaze = true
        elsif entryGate == "W"
            currentLocation = ltCorner
            insideMaze = true
        else
          puts "You chose a wrong value"
          next 
        end
      end
      
      #puts currentLocation
      currentRoom = rooms[currentLocation]
      if currentRoom.nil?
        puts "You are out of the maze"
        insideMaze = false
        next
      else
        puts "You enter a room."
      end
      options = maze.presentRoom(currentRoom)

      if not currentRoom.getTreasure.nil?
        if not currentRoom.getMonster.hasMonster
          puts "Congratulations! You are a winner."
          break
        end
      end
      
      puts "What do you want to do? #{options}"
      choice = gets.chomp
      puts choice
      
      # if user choose to fight RPS module is triggered
      if choice == "F"
        puts "You have challenged a monster"
        fight = RPS::RockPaperScissors.new
        if not fight.play_game
          puts "You Loose"
        break
        else
          puts "You won the fight"
          if not currentRoom.getTreasure.nil?
            puts "Congratulations! You are a winner."
            notWon = false
            break
          end
        end
      else
        #if user wants to leave then deciding if the monster is attacking the user.
        if currentRoom.getMonster.wantToFight
          puts "Monster is attacking you"
          fight = RPS::RockPaperScissors.new
          if not fight.play_game
            puts "You Loose"
            break
          else
            puts "You won the fight"
            if not currentRoom.getTreasure.nil?
               puts "Congratulations! You are a winner."
               notWon = false
               break
            end
          end
        else
          #if there is a treasure in the room, the user will win
          if not currentRoom.getTreasure.nil?
             puts "Congratulations! You are a winner."
             notWon = false
             break  
          end
        end
        tempDoorsAvailable = maze.availableDoors(currentRoom)
        currentLocation = maze.makeMove(currentRoom, tempDoorsAvailable, currentLocation)
        puts currentLocation
      
      end #end if
      
    end #end while

  end# end class
end #end module