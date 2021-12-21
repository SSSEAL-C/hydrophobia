# Insert your tick commands here! (These commands run 20 times per second.) 

title @a actionbar [{"text": "Hydrophobia v1.0.1", "color":"#2e1fb8", "bold":true},{"text": " by ", "color":"#000000","bold":false},{"text": "realsovietseal ", "color":"#bf0cc9", "bold":true}]

#player gamemodes
scoreboard players set @a PlayerGamemode 0
scoreboard players set @e[type=player,gamemode=survival] PlayerGamemode 1
scoreboard players set @e[type=player,gamemode=adventure] PlayerGamemode 1


#Weather Check
scoreboard players set Rain Weather 0
scoreboard players set @a Blocks 0
scoreboard players set @a RainBiome 0
execute unless predicate nowater:clear run scoreboard players set Rain Weather 1
execute as @a at @s run function nowater:main