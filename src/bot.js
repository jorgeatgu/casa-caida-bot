const Twit = require('twit');
const config = require('./config');
const fs = require('fs');
const data = require('../data/2020/aragon-1900-2020.json');
const bot = new Twit(config);
let dataFiltered = data

const getRandom = () => data.length * Math.random() | 0

function randomItem() {
  const item = getRandom()
  const { published } = dataFiltered[item]
  if (!published) {
    dataFiltered[item].published = true
    dataFiltered.splice(dataFiltered.findIndex(({ published }) => published), 1)
    createImages(dataFiltered[item])
  } else {
    randomItem()
  }
}

setInterval(
  (() => {
    randomItem()
  }),
  21600000
);

function createImages(element) {
  const { milnovecientos, dosmilveinte, name, percentage, province } = element

  const municipality = parseNameOfTheMunicipality(name);
  const tweetText = `${name} en la provincia de #${
      province
  }.
En el año 1900 tenía ${milnovecientos} habitantes.
En el año 2020 tenía ${
      dosmilveinte
  } habitantes.
Ha perdido el ${
      percentage
  }% de sus habitantes.
#despoblacion #EspañaVaciada
www.casacaida.co
`;

  const charts = ['densidad', 'evolucion', 'evolucion2010', 'habitantes']

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
          const altText = createAltText(item, municipality)
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
                  status: tweetText,
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
