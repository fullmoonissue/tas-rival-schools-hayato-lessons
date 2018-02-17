require('utils/class')
require('utils/joypad')
require('utils/table')

Dump = class(function(d, outputFilename)
    d.content = nil
    d.outputFilename = outputFilename
end)

function Dump:process(section)
    local bj = BizhawkJoypad()
    local inputs = bj:getInputs(section)
    local orderedFrames = bj:getOrderedFrames(inputs)

    local lines = {'joypadSet = {'}
    for index, frame in ipairs(orderedFrames) do
        lines[#lines + 1] = string.rep(' ', 4) .. '[' .. frame .. '] = {'
        for input, _ in pairs(inputs[orderedFrames[index]]) do
            lines[#lines + 1] = string.rep(' ', 8) .. '["' .. input .. '"] = true,'
        end
        lines[#lines + 1] = string.rep(' ', 4) .. '},'
    end
    lines[#lines + 1] = '}'

    self.content = table.concat(lines, "\n")
end

function Dump:write()
    local file = io.open('dump/' .. self.outputFilename, 'w')
    file:write(self.content)
    file:close()
end