const Twit = require('twit');
const config = require('./config');
const fs = require('fs');
const datos = require('../data/aragon-municipios-densidad-inferior.json');
const bot = new Twit(config);

for (let i = 1; i <= datos.length; i++) {
    (function(index) {
        setTimeout(function() {
            let estado = `${datos[i].municipio} en la provincia de #${
                datos[i].provincia
            }.
En el año 1900 tenía ${datos[i].milnovecientos} habitantes.
En el año 2018 tenía ${
                datos[i].dosmil
            } habitantes.
Ha perdido el ${
                datos[i].porcentaje
            }% de sus habitantes.
#despoblacion #EspañaVaciada`;
            let b64content = fs.readFileSync(
                `images/buenas/${datos[i].foto}.jpg`,
                { encoding: 'base64' }
            );
            bot.post('media/upload', { media_data: b64content }, function(
                err,
                data,
                response
            ) {
                // now we can assign alt text to the media, for use by screen readers and
                // other text-based presentations and interpreters
                let mediaIdStr = data.media_id_string;
                let altText = `Gráfica sobre la despoblación en ${
                    datos[i].municipio
                } entre los años 1900 y 2018.`;
                let meta_params = {
                    media_id: mediaIdStr,
                   alt_text: { text: altText }
                };

                bot.post('media/metadata/create', meta_params, function(
                    err,
                    data,
                    response
                ) {
                    if (!err) {
                        // now we can reference the media and post a tweet (media will attach to the tweet)
                        let params = {
                            status: estado,
                            media_ids: [mediaIdStr]
                        };

                        bot.post('statuses/update', params, function(
                            err,
                            data,
                            response
                        ) {
                            console.log(data);
                        });
                    }
                });
            });
        }, i * 3600000);
    })(i);
}
