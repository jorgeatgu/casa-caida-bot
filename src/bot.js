const Twit = require('twit');
const config = require('./config');
const data = require('../data/aragon-municipios-densidad-inferior.json');
const bot = new Twit(config);

for (let i = 1; i <= data.length; i++) {
    (function(index) {
        setTimeout(function() {
            let status = `${data[i].municipio} en el año 1900 tenía ${
                data[i].milnovecientos
            } habitantes, en 2018 tiene ${
                data[i].dosmil
            } habitantes. Ha perdido el`;
            bot.post(
                'statuses/update',
                {
                    status
                },
                (err, response, data) => {
                    if (err) {
                        console.log(err);
                    } else {
                        console.log('Post success!');
                    }
                }
            );
        }, i * 60000);
    })(i);
}
