local _M = {}


--split function
function _M.Split(s, sp,features_for_predict)
    local res = {}
    local temp = s
    local len = 0
    local count = 1
    while true do
        len = string.find(temp, sp)
        if len ~= nil then
            local result = string.sub(temp, 1, len-1)
            temp = string.sub(temp, len+1)
            --table.insert(res, result)
            res[result] = count
	    features_for_predict[count] = 0
            count = count + 1
        else 
            --table.insert(res, temp)
	    res[temp] = count
	    features_for_predict[count] = 0
            count = count + 1
            break
        end
    end
    return res,count
end



-- load model and store in mem
-- need to be rewritten when model changes
function _M.load(features_for_predict,file)
    local model_attrs = {}
    local num = 0
    local count = 0

    local f = io.open(file, "r")
    if not f then
        ngx.log(ngx.ERR, 'file not exist: ', file)
        return nil
    end

    io.input(f)
    line = io.read()
    model_attrs, count  = _M.Split(line,",",features_for_predict)	

    return model_attrs,count-1
end

return _M
