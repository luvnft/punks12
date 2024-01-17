require 'cocos'


##
# read in all meta data records of all 10 000 punks
recs = read_csv( './etc/punks12px.ii.csv' )
puts "#{recs.size} punk(s)"  #=> 10000 punk(s)


meta = recs.map { |rec| rec.values }


###
# add more ordinal (sub1k) punks  
specs = parse_data( <<DATA )
 ## orange pilled
 9912, Orange,  3D Glasses, Cap Red
 9913, Zombie Orange, Crazy Hair
 9915, Ape Orange, Knitted Cap, Earring, Bubble Gum
 9916, Alien Orange, Spots, Clown Nose, Clown Hair Blue

 9917, Demon Orange, Laser Eyes, Pipe
 9918, Orc Orange,  Eye Mask, Goat, Gold Chain 
 9919, Skeleton Orange, Bandana, Cigarette
 9920, Vampire Orange,  Purple Hair, Classic Shades
 9921, Mummy Orange, Hoodie
 9922, Bot Orange, Big Beard
 
 ## the saudis
 9923, Male 2, Normal Beard Black,  White Shemagh & Agal,  Laser Eyes Gold
 9924, Male 1, Shadow Beard, White Shemagh
 9925, Male 3, Mustache, Red Shemagh & Agal, Earring  
 9926, Male 2, Luxurious White Beard,  Brown Shemagh & Agal 

 9927, Male 1, White Shemagh & Gold Agal, Big Shades 
 9928, Male 3, Spots, Red Shemagh, Gold Chain, Pipe
 9929, Male 1, White Shemagh, Goat, Laser Eyes Gold
 9930, Male 2, White Shemagh & Agal, Clown Eyes Green, Clown Nose

 9931, Male 1, Chinstrap, Red Shemagh & Agal, Horned Rim Glasses  
 9932, Male 3, Normal Beard Black, Brown Shemagh & Agal, Small Shades 
 9933, Male 2, Shadow Beard, Red Shemagh, Nerd Glasses, Bubble Gum
 9934, Orange, White Shemagh & Gold Agal,  Laser Eyes


  ## bonus red aliens
  9935,  Alien Red, Shadow Beard,  Hoodie, Earring                     # inscribe no. 55473236
  9936,  Alien Red, Luxurious Beard, Hoodie, Laser Eyes Gold, Earring  # inscribe no. 55475227

  9937,  Male 4, Cowboy Hat, Tears, Frown      # cowboys dont cry
  
  9938,  Male 2, Birthday Hat, Bubble Gum   #2
  9939,  Male 1, Cap Burger King    #7
  9940,  Female 1, Bow  #19
  9941,  Zombie Female, Birthday Hat, VR   #39
  9942,  Blue, Cap Burger King, Classic Shades  #46
  9943,  Ape Gold, Laser Eyes  #0
  9944,   Female 1, Flowers, Gold Chain   #3
  9945,   Ape Blue, Buck Teeth, Cowboy Hat  #5
  9946,    Vampire, Demon Horns   #8
  9947,    Ape Zombie, Bubble Gum  #20
  9948,     Male 2, Sombrero, Mustache   #25
  9949,    Vampire, Bubble Gum, Spots, Do-rag  #26
  9950,    Mummy, Beanie   #27
  9954,    Male 2, Jester Hat  #30
  9956,    Male 1, Cap Red    #31
  9957,    Male 1, Buck Teeth, 3D Glasses, Cigarette   #37
  9958,    Mummy, Crown    #41
  9959,    Demon Female, Cigar, Choker  #42
  9960,    Female 4, Frumpy Hair, Nerd Glasses   #43
  9961,    Ape Alien, Goat, Fedora  #50
  9963,    Demon Female, Frumpy Hair, Clown Nose  #53
  9964,    Male 3, Heart Shades, Do-rag  #54
  9966,    Vampire Female, Heart Shades  #58
  9967,    Ape Female, Sombrero  #66
  9968,    Mummy, Dark Hair      #72
  9969,    Orc                  #80 
  9970,    Vampire Female, Dark Hair   #81
  9971,    Mummy, Cowboy Hat, Eye Mask (A)    # 82
  9973,    Vampire,   Demon Horns, Chinstrap  #90
  9974,    Ape Alien, Eye Patch, Frumpy Hair  #94  
DATA



specs.each do |values|
   id = values[0].to_i(0)
   meta[ id ] = [ 
                    id.to_s, 
                    values[1], 
                    values[2..-1].join( ' / ')
                  ]
end


headers = ['id', 'type', 'attributes']
File.open( "./punks12px.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"

