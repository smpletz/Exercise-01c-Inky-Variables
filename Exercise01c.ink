/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR coins = 0
VAR strength = 10

-> memory

== memory == 
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]  
    ~pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

{torch_pickup: You have {torches} torches}

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Spot": Spot would love it here in the west| }
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
~ strength -= 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.

{not torch_pickup2:There is a torch on the wall.}
{not sack_pickup:There is a sack on the floor.| The coins are begging to be collected.}

* [Take the torch] -> torch_pickup2
* [Pick up the sack] -> sack_pickup
+ {sack_pickup} [Collect coins] -> coin_pickup
-> END

== torch_pickup2 ==
~ torches += 1
~ strength -= 1
The cave grows brighter.
You now have {torches} torches.
* [Go Back] -> east_tunnel_lit

== sack_pickup == 
You now have a sack
* [Go Back] -> east_tunnel_lit

== coin_pickup == 
~ coins += 3
~ strength -= 4
You used all the strength you could spare to pick up all the coins you could and stuffed them in your sack.
You now have {coins} coins
* [Look around some more] -> east_tunnel2

== east_tunnel2 == 
You see even more coins all around you, but you feel pretty tired after all that heavy lifting.
* [Pick up more coins] -> coin_pickup2
* [Go home] -> leave

== coin_pickup2 ==
~ coins += 3
~ strength -= 4
You pick up even more coins. Now youre completely worn out, but at least you have {coins} coins!
You notice another torch buried in the coins.
* [Pick up torch] -> torch_pickup3
* [Go home] -> leave

== torch_pickup3 ==
~ torches += 1
{torches == 3: The torches are now all lit in your hand, but your feeble arms can't handle the weight. They fall down all at once, lighting you on fire. There are a couple thousand coins here so why would you waste precious strength on torches? -> END|You pick up the second torch and the cave grows even brighter}
* {torches < 3} [Go home] -> leave

== leave ==
You make your way to the exit of the cave. After smelling the breeze come in thorugh the cave mouth, the smell of daisies is immediately smothered by a rancid scent. It's a troll!
* [Inspect the troll] -> troll

== troll ==
Nevermind, that's just Todd. You hate Todd. He doesn't bathe and insisted on coming along on this adventure through the forest on your grandparent's property. What could he possibly want?
* [Ask Todd why he's in your way] -> todd_question

== todd_question ==
You - What do you want Todd?
Todd - What's in the sack?

* [Show him] -> show
* [Tell him to get out of the way] -> tell

== show ==
You show Todd the {coins} coins in your sack.
Todd - I want some!

* [Tell him too bad and leave the cave] -> tell
* [Give him a coin] -> give

== give ==
You give Todd a coin.
Todd - I want more!

* [Call him a greedy, smelly slob and leave the cave] -> tell
* [Give him another coin] -> give2

== give2 ==
You give Todd another coin. You slip past him while he's looking at his disgusting reflection and go home, leaving him to bask in the $0.50 he now has to his name. You'll come back tomorrow with more energy and get the rest of them. He's to dense to figure out that the coins came from. For now you get to put your {coins} coins in your piggy bank.
-> END

== tell ==
Todd - GIVE ME THE SACK

Todd pushes you to the ground and starts walking towards your sack.

* [Fight Todd] -> fight

== fight ==
{strength <= 4: You picked up more than you normally would in a week today, making you an easy opponent for Todd. He pummels you easily and leaves with your coins.| You have just enough strength left in you to fend off Todd and reclaim your sack. You tell Todd to take a shower and leave the cave with your {coins} coins. You consider spending your coins on getting Todd some body wash, but decide that he probably wouldn't use it anyway and put it into your brass knuckles savings account. What a strange thing for an 11-year-old to have.}
-> END










