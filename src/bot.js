const Twit = require('twit');
const config = require('./config');
const fs = require('fs');
const bot = new Twit(config);
const stream = bot.stream('statuses/filter', { track: '@casacaida' });
const municipalitiesAraEsp = require("./shared/aragones.js")
const municipalitiesEspAra = require("./shared/aragones-esp.js")
const municipalitiesCatEsp = require("./shared/catalan.js")
const municipalitiesEspCat = require("./shared/catalan-esp.js")
const municipalities = require("./shared/municipality.js")
const municipalitiesDemographic = require("./shared/densidad.js")

stream.on('tweet', parseTweet)

function parseTweet(message) {
  const {
    in_reply_to_screen_name: replyTo,
    text: text,
    user: {
      screen_name: userName
    }
  } = message

  let nameOfTheMunicipality = text.replace(/@casacaida /g,'');
  let nameOfTheMunicipalityAraCat = ''

  if (municipalitiesAraEsp.find(d => d === nameOfTheMunicipality)) {
    nameOfTheMunicipalityAraCat = nameOfTheMunicipality
    const indexAra = municipalitiesAraEsp.findIndex(d => d === nameOfTheMunicipality)
    nameOfTheMunicipality = municipalitiesEspAra[indexAra]
  } else if (municipalitiesCatEsp.find(d => d === nameOfTheMunicipality)) {
    nameOfTheMunicipalityAraCat = nameOfTheMunicipality
    const indexCat = municipalitiesCatEsp.findIndex(d => d === nameOfTheMunicipality)
    nameOfTheMunicipality = municipalitiesEspCat[indexCat]
  }

  if (nameOfTheMunicipality === 'aleatorio') {
    nameOfTheMunicipality = randomMunicipality('aleatorio')
  } else if (nameOfTheMunicipality === 'densidad') {
    nameOfTheMunicipality = randomMunicipality('densidad')
  }

  if (replyTo === 'casacaida') {
    createImagesTweet(nameOfTheMunicipality, userName, nameOfTheMunicipalityAraCat)
  }
}

function createImagesTweet(nameOfTheMunicipality, userName, nameOfTheMunicipalityAraCat = '') {
  if(!municipalities.some(d => d === nameOfTheMunicipality)) {
    const params = {
      status: `@${userName} ¡Jodoooo! !Vaya garrampazo! No encuentro el nombre del municipio. Igual lo has escrito mal 🤖`
    };
    createTweet(params)
    return
  }
  statsMunicipalities(nameOfTheMunicipality)

  const municipality = parseNameOfTheMunicipality(nameOfTheMunicipality);
  const munipalityName = nameOfTheMunicipalityAraCat !== '' ? nameOfTheMunicipalityAraCat : nameOfTheMunicipality

  const charts = ['densidad','evolucion', 'evolucion2010', 'habitantes']

  let stringImages = []

  for(let item of charts) {
    const b64content = fs.readFileSync(
      `images/${item}/${municipality}.jpg`, { encoding: 'base64' }
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
          const altText = createAltText(item, munipalityName)
          let meta_params = {
            media_id: stringImages[index],
            alt_text: { text: altText }
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
                  status: `@${userName} Aquí tienes cuatro gráficas de ${munipalityName} #Aragón`,
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

function parseNameOfTheMunicipality(municipality) {
  return municipality
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/ /g, "");
}

function createAltText(item, municipality) {
  if (item === 'densidad') {
    return `Gráfica con la evolución de la densidad demógrafica entre 1900 y 2020 en ${municipality}`
  } else if (item === 'evolucion') {
    return `Gráfica con la evolución de la población entre 1900 y 2020 en ${municipality}`
  } else if (item === 'evolucion2010') {
    return `Gráfica con la evolución de la población entre 2010 y 2020 en ${municipality}`
  } else if (item === 'habitantes') {
    return `Gráfica con los diferentes grupos de edad en ${municipality}`
  }
}

function randomMunicipality(arrayValue) {
  const selectArray = arrayValue === 'aleatorio' ? municipalities : municipalitiesDemographic
  return selectArray[Math.floor(Math.random() * selectArray.length)]
}

function statsMunicipalities(municipality) {
  const streamFile = fs.createWriteStream("stats.txt", {flags:'a'});
  streamFile.once('open', function(fd) {
    streamFile.write(`${randomMunicipality}\n`);
    streamFile.end();
  });
}
