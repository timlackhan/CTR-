local _M = {
    gen_adslot_labels = function (features_for_predict, args,model_attrs)
    	local s= "adslot_id__" .. args["adslot_id"]
    	local key
    	if (not model_attrs[s]) then
    		key = "other adslot_id"
    	else
    		key ="adslot_id__" .. args["adslot_id"]
    	end
	features_for_predict[model_attrs[key]] = 1
	
    end,
    
    gen_adx = function (features_for_predict,args,model_attrs)
	features_for_predict[model_attrs["adx"]] = tonumber(args["adx"]) or 0
    end,

    gen_impct = function (features_for_predict,args,model_attrs)
	features_for_predict[model_attrs["impct"]] = tonumber(args["impct"]) or 0
    end,

    gen_platform_labels = function (features_for_predict,args,model_attrs)
	local s = "platform__"..args["platform"]
	local key
	if (not model_attrs[s]) then
		key = "other platform"
	else
		key = "platform__"..args["platform"]
	end
	features_for_predict[model_attrs[key]] = 1
    end,

    gen_geo_labels = function (features_for_predict,args,model_attrs)
	local s = "geo__"..args["geo"]
	local key
	if (not model_attrs[s]) then
		key = "other geo"
	else
		key = "geo__"..args["geo"]
	end
	features_for_predict[model_attrs[key]] = 1
    end,

    gen_advertiser_id = function (features_for_predict,args,model_attrs)
	local s = "advertiser_id__"..args["advertiser_id"]
	local key
	if (not model_attrs[s]) then
		key = "other advertiser_id"
	else
		key = "advertiser_id__"..args["advertiser_id"]
	end
	features_for_predict[model_attrs[key]] = 1
    end,

    gen_adslot_pos = function (features_for_predict,args,model_attrs)
	features_for_predict[model_attrs["adslot_pos"]] = tonumber(args["adslot_pos"]) 
    end,

    gen_creative_id = function (features_for_predict,args,model_attrs)
	features_for_predict[model_attrs["creative_id"]] = tonumber(args["creative_id"])
    end,

    gen_creative_size = function (features_for_predict,args,model_attrs)
        local s = "creative_size__"..args["creative_size"]
        local key
        if (not model_attrs[s]) then
                key = "other creative_size"
        else
                key = "creative_size__"..args["creative_size"]
        end
        features_for_predict[model_attrs[key]] = 1
    end,



    gen_os = function (features_for_predict,args,model_attrs)
	local s = "os__"..args["os"]
	local key
	if (not model_attrs[s]) then
		key = "other os"
	else
		key = "os__"..args["os"]
	end
	features_for_predict[model_attrs[key]] = 1
    end,
	
    gen_browser = function (features_for_predict,args,model_attrs)
        local s = "browser__"..args["browser"]
        local key
        if (not model_attrs[s]) then
                key = "other browser"
        else
                key = "browser__"..args["browser"]
        end
        features_for_predict[model_attrs[key]] = 1
    end,

    gen_devicetype = function(features_for_predict,args,model_attrs)
	features_for_predict[model_attrs["devicetype"]] = tonumber(args["devicetype"])
    end,

    gen_pday = function (features_for_predict,args,model_attrs)
	local weekday = os.date("*t",args["ts"]).wday
        if (weekday >= 2 and weekday <= 6)  then
		features_for_predict[model_attrs["pday"]] = 1
	else
		features_for_predict[model_attrs["pday"]] = 0
        end
    end,

    gen_phour = function (features_for_predict,args,model_attrs)
	local hour = os.date("*t",args["ts"]).hour
	if (hour >= 17 and hour <= 21) then
		features_for_predict[model_attrs["phour"]] = 1
	else
		features_for_predict[model_attrs["phour"]] = 0
	end
    end

}


return _M
