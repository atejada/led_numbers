function split(s,delim)
	result = {}
	for match in (s..delim):gmatch("(.-)"..delim) do
		table.insert(result,match)
	end
	return result
end

leds = {[0] = " _  ,| | ,|_| ",
        [1] = "  ,| ,| ",
        [2] = " _  , _| ,|_  ",
        [3] = "_  ,_| ,_| ",
        [4] = "    ,|_| ,  | ",
        [5] = " _  ,|_  , _| ",
        [6] = " _  ,|_  ,|_| ",
        [7] = "_   , |  , |  ",
        [8] = " _  ,|_| ,|_| ",
        [9] = " _  ,|_| , _| "}

io.write("Enter a number: ")
num = io.read()
for i = 1,3 do
	for j = 1, #num do
		line=split(leds[tonumber(string.sub(num,j,j))],",")
		io.write(line[i])
	end
	print("")
end
