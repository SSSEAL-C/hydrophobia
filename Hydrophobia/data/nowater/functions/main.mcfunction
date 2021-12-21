#water wither
execute unless score @s PlayerLeave matches 0 run function nowater:player
execute if score @s PlayerGamemode matches 1 if predicate nowater:water run scoreboard players set @s WaterCheck 1
execute if score @s PlayerGamemode matches 1 unless predicate nowater:water run scoreboard players set @s WaterCheck 0

#weather check
execute unless predicate nowater:biome_check run scoreboard players set @s RainBiome 1 
execute if block ~ ~ ~ minecraft:air if blocks ~ ~ ~ ~ 318 ~ ~ ~1 ~ all run scoreboard players set @s Blocks 1
execute if score @s RainBiome matches 1 if score @s Blocks matches 1 if score Rain Weather matches 1 unless entity @s[nbt={ActiveEffects:[{Id:19b}]}] run effect give @s minecraft:wither 999999 3 true
execute if score @s PlayerGamemode matches 1 if score @s WaterCheck matches 1 if score @s WaterCheckPrev matches 0 run effect give @s minecraft:wither 999999 3 true
execute if score @s PlayerGamemode matches 1 if score @s WaterCheck matches 1 if score @s WaterCheckPrev matches 1 unless entity @s[nbt={ActiveEffects:[{Id:19b}]}] run effect give @s minecraft:wither 999999 3 true

execute if entity @s[nbt={ActiveEffects:[{Id:19b}]}] if score @s Health matches 1 run kill @s

#clear effects
execute if score @s Blocks matches 0 if score @s WaterCheck matches 0 run effect clear @s minecraft:wither
execute if score @s RainBiome matches 0 if score @s WaterCheck matches 0 run effect clear @s minecraft:wither
execute if score Rain Weather matches 0 if score @s WaterCheck matches 0 run effect clear @s minecraft:wither

#reset vals
scoreboard players operation @s WaterCheckPrev = @s WaterCheck