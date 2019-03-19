var fs = require('fs');
var express = require("express");
var app = express();
var fsOpts = { flag: 'r', encoding: 'utf8' };

app.listen(3000, () => {
 console.log("Server running on port 3000");
});


app.get("/", (req, res, next) => {
	fs.readFile("listado.txt", fsOpts, function(err, data){
		if (err) throw err;

		var response = [];
		data.toString().split(/\n/).forEach(function(line){
			var aux = line.split("|");
			if (aux[0] === req.query.ruc){
			 	response = [line.split("|")];
				return;
			}
		});
		res.json(response);
	});
});
