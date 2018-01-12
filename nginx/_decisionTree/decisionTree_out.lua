_decisionTree = {}
function _decisionTree.predict(x)
if (x[285] <= 0.0) then
if (x[223] <= 11654.0) then
if (x[295] <= 0.0) then
if (x[4] <= 0.0) then
if (x[7] <= 0.0) then
return 0.0
elseif (x[7] > 0.0) then
return 1.0
end
elseif (x[4] > 0.0) then
if (x[283] <= 0.0) then
return 0.0
elseif (x[283] > 0.0) then
return 1.0
end
end
elseif (x[295] > 0.0) then
return 1.0
end
elseif (x[223] > 11654.0) then
if (x[279] <= 1.0) then
if (x[292] <= 0.0) then
return 1.0
elseif (x[292] > 0.0) then
if (x[222] <= 0.0) then
return 1.0
elseif (x[222] > 0.0) then
return 0.0
end
end
elseif (x[279] > 1.0) then
if (x[139] <= 0.0) then
if (x[229] <= 0.0) then
return 0.0
elseif (x[229] > 0.0) then
return 1.0
end
elseif (x[139] > 0.0) then
return 1.0
end
end
end
elseif (x[285] > 0.0) then
if (x[1] <= 0.0) then
if (x[15] <= 0.0) then
if (x[223] <= 11688.0) then
return 1.0
elseif (x[223] > 11688.0) then
if (x[292] <= 0.0) then
return 1.0
elseif (x[292] > 0.0) then
return 0.0
end
end
elseif (x[15] > 0.0) then
if (x[303] <= 1.0) then
return 0.0
elseif (x[303] > 1.0) then
if (x[303] <= 2.0) then
return 0.0
elseif (x[303] > 2.0) then
return 0.0
end
end
end
elseif (x[1] > 0.0) then
if (x[303] <= 2.0) then
if (x[303] <= 0.0) then
return 1.0
elseif (x[303] > 0.0) then
if (x[294] <= 0.0) then
return 0.0
elseif (x[294] > 0.0) then
return 0.0
end
end
elseif (x[303] > 2.0) then
if (x[294] <= 0.0) then
return 1.0
elseif (x[294] > 0.0) then
if (x[303] <= 5.0) then
return 0.0
elseif (x[303] > 5.0) then
return 1.0
end
end
end
end
end
end
return _decisionTree