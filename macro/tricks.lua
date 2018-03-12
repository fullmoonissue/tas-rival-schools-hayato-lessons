require('utils/class')

MacroTricks = class(function(macroTricks, macro)
    macroTricks.input = macro:getInputManager()
end)

function MacroTricks:crouch(currentFrame)
    return self.input:down(currentFrame, 6)
end

function MacroTricks:steppingLeft(currentFrame)
    self.input:left(currentFrame)

    currentFrame = currentFrame + 2
    self.input:left(currentFrame)

    return currentFrame
end

function MacroTricks:steppingRight(currentFrame)
    self.input:right(currentFrame)

    currentFrame = currentFrame + 2
    self.input:right(currentFrame)

    return currentFrame
end

function MacroTricks:ditchInto(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Circle'] = true,
                [self.input.currentPlayer .. ' Cross'] = true,
            }
    )
end

function MacroTricks:ditchOut(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Down'] = true,
                [self.input.currentPlayer .. ' Circle'] = true,
                [self.input.currentPlayer .. ' Cross'] = true,
            }
    )
end

function MacroTricks:highJump(currentFrame)
    self.input:down(currentFrame)

    currentFrame = currentFrame + 1
    self.input:up(currentFrame)

    return currentFrame
end

function MacroTricks:throw(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Square'] = true,
                [self.input.currentPlayer .. ' Triangle'] = true,
            }
    )
end

function MacroTricks:bottomThrow(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Down'] = true,
                [self.input.currentPlayer .. ' Square'] = true,
                [self.input.currentPlayer .. ' Triangle'] = true,
            }
    )
end

function MacroTricks:safeFall(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Circle'] = true,
                [self.input.currentPlayer .. ' Square'] = true,
            }
    )
end

function MacroTricks:teamUp(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Cross'] = true,
                [self.input.currentPlayer .. ' Square'] = true,
            }
    )
end

function MacroTricks:hinataTextbookCombo2(currentFrame)
    self.input:cross(currentFrame)

    currentFrame = currentFrame + 2
    self.input:square(currentFrame)

    return currentFrame
end

function MacroTricks:hinataTextbookCombo3(currentFrame)
    currentFrame = self:hinataTextbookCombo2(currentFrame)

    currentFrame = currentFrame + 21
    self.input:triangle(currentFrame)

    return currentFrame
end

function MacroTricks:hinataTextbookCombo4(currentFrame, reverse)
    currentFrame = self:hinataTextbookCombo3(currentFrame)

    currentFrame = currentFrame + 14
    self.input:add(
            currentFrame,
            1,
            {
                [self.input.currentPlayer .. ' ' .. ((reverse or false) and 'Left' or 'Right')] = true,
                [self.input.currentPlayer .. ' Triangle'] = true,
            }
    )

    return currentFrame
end

function MacroTricks:hinataRivalLauncher(frame, reverse)
    return self.input:add(
            frame,
            1,
            {
                [self.input.currentPlayer .. ' Down'] = true,
                [self.input.currentPlayer .. ' ' .. ((reverse or false) and 'Left' or 'Right')] = true,
                [self.input.currentPlayer .. ' Circle'] = true,
            }
    )
end

function MacroTricks:hinataTardyCounter(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Right'] = true,
                [self.input.currentPlayer .. ' Triangle'] = true,
            }
    )
end

function MacroTricks:burningVigor(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' L1'] = true,
            }
    )
end

function MacroTricks:upLeft(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Up'] = true,
                [self.input.currentPlayer .. ' Left'] = true,
            }
    )
end

function MacroTricks:upRight(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Up'] = true,
                [self.input.currentPlayer .. ' Right'] = true,
            }
    )
end

function MacroTricks:downLeft(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Down'] = true,
                [self.input.currentPlayer .. ' Left'] = true,
            }
    )
end

function MacroTricks:downRight(frame, iterations)
    return self.input:add(
            frame,
            iterations,
            {
                [self.input.currentPlayer .. ' Down'] = true,
                [self.input.currentPlayer .. ' Right'] = true,
            }
    )
end