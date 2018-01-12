path = "F:\\LUA\\vMatrix" --read the path of v matrix
x={0,1,0,1,12}  -- the coming feature
X = {}  -- keys are the indexs of elements which is not equal to 0 in x
		-- values are the elements corresponding to the key indexes
X_square = {} -- keys are the indexs of elements which is not equal to 0 in x
		      -- values are the square of the elements corresponding to the key indexes
v = {} -- the matrix v
V = {} -- the filter of v
VX = {}
VX_square = {}
phi = 0
prob = 0


model_fm = require "fm"

v,row,col = model_fm.read_VMatrix(path,v) -- read the matrix v
prob = model_fm.predict(x,V)
print(prob)
