--[[
    GD50
    Pokemon

    Assignment add-on
    By: Philip Lee

    Level Up Menu State shows the stat increases upon leveling up in a battle.
]]

LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(battleState)
    self.battleState = battleState
    self.playerPokemon = self.battleState.player.party.pokemon[1]
    self.HPIncrease, self.attackIncrease, self.defenseIncrease, self.speedIncrease = self.playerPokemon:levelUp()
    print(self.HPIncrease, self.attackIncrease, self.defenseIncrease, self.speedIncrease)

    self.levelUpMenu = Menu {
        x = VIRTUAL_WIDTH - 96,
        y = VIRTUAL_HEIGHT - 64,
        width = 96,
        height = 64,
        cursor = false,
        items = {
            {
                text = 'HP: ' .. tostring(self.playerPokemon.HP - self.HPIncrease) ..
                        ' + ' .. tostring(self.HPIncrease) ..
                        ' = ' .. tostring(self.playerPokemon.HP),
            },
            {
                text = 'At: ' .. tostring(self.playerPokemon.attack - self.attackIncrease) ..
                        ' + ' .. tostring(self.attackIncrease) ..
                        ' = ' .. tostring(self.playerPokemon.attack),
            },
            {
                text = 'Df: ' .. tostring(self.playerPokemon.defense - self.defenseIncrease) ..
                        ' + ' .. tostring(self.defenseIncrease) ..
                        ' = ' .. tostring(self.playerPokemon.defense),
            },
            {
                text = 'Sp: ' .. tostring(self.playerPokemon.speed - self.speedIncrease) ..
                        ' + ' .. tostring(self.speedIncrease) ..
                        ' = ' .. tostring(self.playerPokemon.speed),
            }
        }
    }
end

function LevelUpMenuState:update(dt)
    self.levelUpMenu:update(dt)

    if love.keyboard.wasPressed('space') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateStack:pop()
    end
end

function LevelUpMenuState:render()
    self.levelUpMenu:render()
end