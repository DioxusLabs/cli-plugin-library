local tools = {}

tools['dump'] = function (object)
    if type(object) == 'table' then
        local s = '{ '
        for k,v in pairs(object) do
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '['..k..'] = ' .. tools.dump(v) .. ','
        end
        return s .. '} '
     else
        return tostring(object)
     end
end

return tools