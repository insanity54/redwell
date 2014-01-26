// routes that the user can visit which display info to the user

var routes = function(app) {
    app.get('/', function(req, res) {
        res.send('root');
    });
};

module.exports = routes;
