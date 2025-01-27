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
VAR fazcoins = 0
VAR vending_items = 0


-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie] 
~ pet_name = "Charlie"
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

You have {torches} torches.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel.
You see something glinting on the ground.

{pet_name == "Spot": Scout would love it here in the west| }
+ [Investigate "Glint"] -> faz_coin
+ [Forwards!] -> west_cave
+ [Go Back] -> cave_mouth
-> END

== west_cave ==
You have entered the west cave.
You can spot a vending machine nearby.

+ [Approach the Vending Machine] -> vending_machine
+ [Go Back] -> west_tunnel

-> END

== vending_machine ==
There is a generic looking vending machine infront of you.
You can see a variety of chips, sodas, and candy bars. However, it seems to be out of the good ones.
You can buy Fritos for 2, Crush for 3, and Snickers for 5 faz-coins respectively.
You have {vending_items} items from the vending machine.

* {fazcoins >= 5} [Buy Snickers] -> snicker_realm
* {fazcoins >= 3} [Buy Crush] -> crush_realm
* {fazcoins >= 2} [Buy Fritos] -> fritos_realm

+ [Go Back] -> west_cave

-> END
== snicker_realm ==
You have purchased a Snickers successfully.
~ vending_items = vending_items + 1
~ fazcoins = fazcoins - 5
+ [Go Back] -> vending_machine
-> END
== crush_realm ==
You have purchased a Crush successfully.
~ vending_items = vending_items + 1
~ fazcoins = fazcoins - 3
+ [Go Back] -> vending_machine
-> END
== fritos_realm ==
You have purchased a Fritos successfully.
~ vending_items = vending_items + 1
~ fazcoins = fazcoins - 2
+ [Go Back] -> vending_machine
-> END
== faz_coin ==
~ fazcoins = fazcoins + 1
You found a faz-coin! You now have {fazcoins} faz-coins total!

+ [Return to Cave Entrance] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END