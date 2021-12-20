# Insert your tick commands here! (These commands run 20 times per second.) 

title @a actionbar [{"text": "Hydrophobia v1.0", "color":"#2e1fb8", "bold":true},{"text": " by ", "color":"#000000","bold":false},{"text": "realsovietseal ", "color":"#bf0cc9", "bold":true}]

#player gamemodes
scoreboard players set @a PlayerGamemode 0
scoreboard players set @e[type=player,gamemode=survival] PlayerGamemode 1
scoreboard players set @e[type=player,gamemode=adventure] PlayerGamemode 1

#water wither
execute as @a unless score @s PlayerLeave matches 0 run function nowater:player
execute as @a at @s if score @s PlayerGamemode matches 1 if block ~ ~ ~ water run scoreboard players set @s WaterCheck 1
execute as @a at @s if score @s PlayerGamemode matches 1 unless block ~ ~ ~ water run scoreboard players set @s WaterCheck 0

#Weather Check
scoreboard players set Rain Weather 0
scoreboard players set @a Blocks 0
scoreboard players set @a RainBiome 0
execute unless predicate nowater:clear run scoreboard players set Rain Weather 1
execute as @a at @s unless predicate nowater:biome_check run scoreboard players set @s RainBiome 1 
execute as @a at @s if block ~ ~ ~ minecraft:air if blocks ~ ~ ~ ~ 318 ~ ~ ~1 ~ all run scoreboard players set @s Blocks 1
execute as @a at @s if score @s RainBiome matches 1 if score @s Blocks matches 1 if score Rain Weather matches 1 unless entity @s[nbt={ActiveEffects:[{Id:19b}]}] run effect give @s minecraft:wither 999999 3 true
execute as @a at @s if score @s PlayerGamemode matches 1 if score @s WaterCheck matches 1 if score @s WaterCheckPrev matches 0 run effect give @s minecraft:wither 999999 3 true
execute as @a at @s if score @s PlayerGamemode matches 1 if score @s WaterCheck matches 1 if score @s WaterCheckPrev matches 1 unless entity @s[nbt={ActiveEffects:[{Id:19b}]}] run effect give @s minecraft:wither 999999 3 true

execute as @a at @s if entity @s[nbt={ActiveEffects:[{Id:19b}]}] if score @s Health matches 1 run kill @s

#clear effects
execute as @a at @s if score @s Blocks matches 0 if score @s WaterCheck matches 0 run effect clear @s minecraft:wither
execute as @a at @s if score @s RainBiome matches 0 if score @s WaterCheck matches 0 run effect clear @s minecraft:wither
execute as @a at @s if score Rain Weather matches 0 if score @s WaterCheck matches 0 run effect clear @s minecraft:wither

#reset vals
execute as @a at @s run scoreboard players operation @s WaterCheckPrev = @s WaterCheck