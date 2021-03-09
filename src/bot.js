const Twit = require('twit');
const config = require('./config');
const fs = require('fs');
const datos = require('../data/tweet02.json');
const bot = new Twit(config);
const stream = bot.stream('statuses/filter', { track: '@casacaida' });
import {
  municipalitiesAraEsp,
  municipalitiesEspAra
} from './shared/aragones.js'

import {
  municipalitiesCatEsp,
  municipalitiesEspCat
} from './shared/catalan.js'

stream.on('tweet', parseTweet)

function parseTweet(message) {
  const {
    in_reply_to_screen_name: replyTo,
    text: text,
    user: {
      screen_name: userName
    }
  } = message
  const nameOfTheMunicipality = text.replace(/@casacaida /g,'');

  let translateMunicipality
  testAra.normalize("NFD").replace(/[\u0300-\u036f]/g, "")
  if (municipalitiesAraEsp.find(d => d === testAra)) {
    const indexAra = municipalitiesAraEsp.findIndex(d => d === testAra)
    translateMunicipality = municipalitiesEspAra[indexAra]
  } else if (municipalitiesCatEsp.find(d => d === testAra)) {
    const indexCat = municipalitiesCatEsp.findIndex(d => d === testAra)
    translateMunicipality = municipalitiesCatEsp[indexCat]
  }

  if (replyTo === 'casacaida') {
    createImagesTweet(nameOfTheMunicipality, userName)
  }
}

function createImagesTweet(nameOfTheMunicipality, userName) {
  const parseNameOfTheMunicipality = nameOfTheMunicipality.toLowerCase();

  const charts = ['densidad','evolucion', 'evolucion2010', 'habitantes']

  let stringImages = []

  for(let item of charts) {
    const b64content = fs.readFileSync(
      `images/${item}/${parseNameOfTheMunicipality}.jpg`, { encoding: 'base64' }
    );
    bot.post('media/upload', { media_data: b64content }, function(
      err,
      data,
      response
    ) {
      const mediaId = data.media_id_string;
      stringImages.push(mediaId);
      if(stringImages.length === 4) {
        let media_ids_string = []
        for (let index = 0; index < stringImages.length; index++) {
          let meta_params = {
            media_id: stringImages[index]
          };
          bot.post('media/metadata/create', meta_params, function(
            err,
            data,
            response
          ) {
            if (!err) {
              media_ids_string.push(meta_params.media_id)
              if (media_ids_string.length === 4) {
                const params = {
                  status: `@${userName} Aquí tienes cuatro gráficas de ${nameOfTheMunicipality} #Aragón`,
                  media_ids: media_ids_string
                };
                createTweet(params)
              }
            } else {
              console.log(err)
            }
          });
        }
      }
    });
  }
}

function createTweet(params) {
  bot.post('statuses/update', params, function(
    err,
    data,
    response
  ) {
    console.log(data);
  });
}
