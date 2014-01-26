// includes express framework, loads configuration, and starts the server.

var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app);
var nconf = require('nconf');
var passport = require('passport');
//var passport-twitter = require('passport-twitter');

// load configuration
nconf.env(['port'])
     .file({ file: 'config.json' });

// set some app-wide variables
app.set('port', nconf.get('PORT'));
port = app.get('port');

app.set('title', nconf.get('TITLE'));
app.set('session_secret', nconf.get('SESSION_SECRET'));
app.set('twitter_consumer_key', nconf.get('TWITTER_CONSUMER_KEY'));
app.set('twitter_secret_key', nconf.get('TWITTER_SECRET_KEY'));


// some expressy stuffy stuff
app.use(express.cookieParser());
//app.use(express.bodyParser());
app.use(express.session({ secret: app.get('session_secret') }));
app.use(passport.initialize());
app.use(passport.session());
app.use(express.logger('dev')); // @todo for production,  change this
//        rclient.on("error", function(err) {
//        console.log("Error " + err);
//});


// api endpoints
require('./server/api/routes')(app);
require('./server/api/auth')(app);

server.listen(port);
console.log('server listening on port ' + port);
