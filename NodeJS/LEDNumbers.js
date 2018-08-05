var express = require('express');
var app = express();
var bodyParser = require('body-parser');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

function getLED(number){
	var result = "";
	var led = {
		0: [" _  ","| | ","|_| "],
		1: ["  ","| ","| "],
		2: [" _  "," _| ","|_  "],
		3: ["_  ","_| ","_| "],
		4: ["    ","|_| ","  | "],
		5: [" _  ","|_  "," _| "],
		6: [" _  ","|_  ","|_| "],
		7: ["_   "," |  "," |  "],
		8: [" _  ","|_| ","|_| "],
		9: [" _  ","|_| "," _| "]
	};
	var len = number.length.toString()
	for(var i = 0; i < 3; i++){
		for(var j = 0; j < len; j++){
			result += led[number[j]][i];
		}
		result += "\n";
	}
	return(result)
}

app.use(express.static('public'));
app.get('/index.htm', function (req, res) {
   res.sendFile( __dirname + "/" + "index.html" );
})

app.post('/process_post', urlencodedParser, function (req, res) {
	var LedNumber = getLED(req.body.lednumber)
	res.end(LedNumber)
})

var server = app.listen(8081, "localhost", function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("LEDNumbers app listening at http://%s:%s", host, port)

})
