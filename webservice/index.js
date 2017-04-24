var express = require('express')
var app = express()

var con;
var mysql;

function init_connect() {
	// body...
	mysql = require("mysql");
	con = mysql.createConnection({
	  host: "localhost",
	  user: "myuser",
	  password: "123456",
	  database: "musium_ibeacon",
	  port: "3306"

	});
	con.on('error', function(err) {
	    console.log('db error', err);
	    if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
	      init_connect();                         // lost due to either server restart, or a
	    } else {                                      // connnection idle timeout (the wait_timeout
	      throw err;                                  // server variable configures this)
	    }
	 });
}

function excuteQuery(query, func) {
	// body...
	con.query(query,function(err,rows){
	  if(err) throw err;

	  // console.log('Data received from Db:\n');
	  func(rows);
	});
}


init_connect();


app.get('/getArtifact', function (req, res) {
  excuteQuery('select * from artifact inner join ibeacon on artifact.ibeaconId = ibeacon.id where macAdrr = \''+req.query.mac+'\'', rows =>{
  		for (var i in rows) {
  			rows[i]['image_url'] = 'http://localhost:3000' + rows[i]['image_url'];
  		}
  		console.log(rows);
  		res.setHeader('Content-Type', 'application/json');
  		res.send(JSON.stringify(rows));
  		//res.send(rows);
  });
})

app.use('/lib', express.static('lib'));
app.use('/lib/images', express.static('lib/images'));


app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})