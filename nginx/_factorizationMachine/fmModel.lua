local _FM = {}


function _FM.Split(s, sp)
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


function _FM.read_VMatrix(path,vMatrix)
	file = io.open(path,"r")
	io.input(file)
	row = 1
	for line in io.lines() do
		col=1
		line = _FM.Split(line,",")
		vMatrix[row]={}
		for index,v in pairs(line) do
			vMatrix[row][col] = v
			col = col+1
		end
		row = row+1
	end
	return vMatrix,row-1,col-1
end


function _FM.predict(x,v,col)
	local X = {}
	local V = {}
	local VX = {}
	local VX_square = {}
	local phi = 0
	local prob = 0
	for i,value in pairs(x) do
		if value ~= 0 then
			X[i] = value
			V[i] = {}
			for j=1,col do
				V[i][j] = v[i][j]
			end
		end
	end
	for i=1,col do
		VX[i] = 0
		VX_square[i] = 0
		for key,value in pairs(X) do
			VX[i] = VX[i] + value*V[key][i]
			VX_square[i] = VX_square[i] + value*value*V[key][i]*V[key][i]
		end
		phi = phi + (VX[i]*VX[i]-VX_square[i])
	end
	phi = phi/2
	prob = 1.0/(1.0+math.exp(-phi))
	return prob
end


return _FM













