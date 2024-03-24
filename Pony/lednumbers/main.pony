actor Main
	var _env: Env
	
	new create(env: Env) =>
		_env = env
		let leds: Array[Array[String]] = [[" _  ","| | ","|_| "],
						  ["  ","| ","| "],
						  [" _  "," _| ","|_  "],
						  ["_  ","_| ","_| "],
						  ["    ","|_| ","  | "],
						  [" _  ","|_  "," _| "],
						  [" _  ","|_  ","|_| "],
						  ["_   "," |  "," |  "],
						  [" _  ","|_| ","|_| "],
						  [" _  ","|_| "," _| "]]
		var num: String = try env.args(1) else "" end
		var i: I64 = 0
		var j: I64 = 0
		var line: String = ""
		var sizec: I64 = try num.size().string().i64() else 0 end
		while i < 3 do
			while j < sizec do
				try line = line.insert(line.size().string().i64(),
						       leds(num.substring(j,j).u64())(i.string().u64())) else "" end
				j = j + 1
			end
			i = i + 1
			j = 0
			_env.out.print(line)
			line = ""
		end
		_env.out.print("")
