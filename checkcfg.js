// checks if config.json exists. If it doesn't, it is created using input from the user.

var fs = require('fs');
var read = require('read');

// @todo clean this up, create a object containing the options instead of using a ton of arguments

function write_config(port, session_secret, twitter_consumer_key, twitter_secret_key, title) {

    config = JSON.stringify({
        "PORT": port,
        "SESSION_SECRET": session_secret,
        "TWITTER_CONSUMER_KEY": twitter_consumer_key,
        "TWITTER_SECRET_KEY": twitter_secret_key,
        "TITLE": title
    }, null, 4);
    
    fs.writeFile('config.json', config, function(err) {
        if (err) throw err;
        console.log('config file written.');
        process.stdin.destroy();
    });
}

function create_config() {
    // get input from user
    // (hello callback hell!)

    read({ prompt: 'Port: ' }, function(err, port) {
        if (err) throw err;
        
        read({ prompt: 'Session secret: ' }, function(err, secret) {
            if (err) throw err;
            
            read({ prompt: 'twitter consumer key: ' }, function(err, t_consumer) {
                if (err) throw err;

                read({ prompt: 'twitter secret key: ' }, function(err, t_secret) {
                    if (err) throw err;

                    read({ prompt: 'title: ' }, function(err, title) {
                        if (err) throw err;                        
                
                        write_config(port, secret, t_consumer, t_secret, title);
                    });
                });
            });
        });
    });    
}



fs.open('config.json', 'r+', function(err) {
    // open the config file in write mode to see if it exists
    if (err) {
        // config doesn't exist so create it
        create_config();
        return
    }
    console.log('config file checks out'); // @todo it would be nice to actually check the config as the title would suggest
});
