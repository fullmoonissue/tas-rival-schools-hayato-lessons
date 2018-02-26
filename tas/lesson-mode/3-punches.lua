local Input = require('utils/input')
require('utils/macro')
require('macro/lesson-mode')

-- Lesson 1.3
local input = Input()
local macroLessonMode = MacroLessonMode(Macro(input))

input:cross(6349)
macroLessonMode:goToLesson(6351, 1, 3)
macroLessonMode:skipIntroText(7137)
--[[
    Begin of exercices
]]
-- Exercice 1
input:triangle(7291)
-- Exercice 2
input:triangle(7363)
-- Exercice 3
input:square(7435)
-- Exercice 4
input:square(7507)
-- Exercice 5
input:triangle(7579)
-- Exercice 6
input:triangle(7651)
-- Exercice 7
input:triangle(7723)
-- Exercice 8
input:triangle(7795)
-- Exercice 9
input:square(7867)
-- Exercice 10
input:square(7939)
--[[
    End of exercices
]]
macroLessonMode:goToLessonScreen(8311)

return input:all()