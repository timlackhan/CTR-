function Split(s, sp)
    local res = {}

    local temp = s
    local len = 0
    while true do
        len = string.find(temp, sp)
        if len ~= nil then
            local result = string.sub(temp, 1, len-1)
            temp = string.sub(temp, len+1)
            table.insert(res, result)
        else
            table.insert(res, temp)
            break
        end
    end

    return res
end


function trim (s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end



decisionTreeRead = io.open("/usr/local/openresty/lualib/script/decisionTree_in.txt","r")
io.input(decisionTreeRead)
io.read()
stack = {}
str = "_decisionTree = {}".."\n".."function _decisionTree.predict(x)".."\n"

for line in io.lines() do
 	line = trim(line)

 	if string.find(line,"If") then
 		table.insert(stack,"if")
 		str = str.."if (x["
 		tab = Split(line," ")
		index = tonumber(tab[3]) + 1
 		str = str..index.."] "..tab[4].." "..tab[5].." then\n"
 	end

 	if string.find(line,"Else") then
 		table.insert(stack,"else")
 		str = str.."elseif (x["
 		tab = Split(line," ")
                index = tonumber(tab[3]) + 1
 		str = str..index.."] "..tab[4].." "..tab[5].." then\n"
 	end

 	if string.find(line,"Predict") then
 		tab = Split(line," ")
 		str = str.."return "..tab[2].."\n"
 		while(stack[table.getn(stack)] == "else") do
 			table.remove(stack,table.getn(stack))
 			table.remove(stack,table.getn(stack))
 			str = str.."end".."\n"
 		end
 	end
end
str=str.."end".."\n".."return _decisionTree"
io.close()

decisionTreeWrite = io.open("/usr/local/openresty/lualib/script/decisionTree_out.lua","w+")
io.output(decisionTreeWrite)
io.write(str)
io.close()



