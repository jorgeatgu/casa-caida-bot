const Twit = require('twit')
const config = require('./config')
const request = require('request')
const fs = require('fs')
const Tabletop = require('tabletop')

const bot = new Twit(config)

const spreadsheetUrl = 'https://docs.google.com/spreadsheets/d/1xi8zOp_oi4Oapr-XY-qUg9hrRVO_uENNzMBQ8Gm28vo/pubhtml'

Tabletop.init({
  key: spreadsheetUrl,
  callback(data, tabletop) {
    data.forEach(d => {
      const status = `${d.municipio} en el año 1900 tenía ${d.milnovecientos} habitantes, en 2018 tiene ${d.dosmil}`;
      console.log(status);
     /* bot.post('statuses/update', {
        status
      }, (err, response, data) => {
        if (err) {
          console.log(err)
        } else {
          console.log('Post success!')
        }
      })*/
    })
  },
  simpleSheet: true
})

/*Tabletop.init({
  key: spreadsheetUrl,
  callback(data, tabletop) {
    data.forEach(d => {
      const status = `${d.municipio} en el año 1900 tenía ${d.milnovecientos} habitantes, en 2018 tiene ${d.dosmil}`;
      console.log(status)
      var b64content = fs.readFileSync(`images/buenas/${d.foto}.png`, { encoding: 'base64' })

      // first we must post the media to Twitter
      bot.post('media/upload', { media_data: b64content }, function (err, data, response) {
        // now we can assign alt text to the media, for use by screen readers and
        // other text-based presentations and interpreters
        var mediaIdStr = data.media_id_string
        var altText = "Small flowers in a planter on a sunny balcony, blossoming."
        var meta_params = { media_id: mediaIdStr, alt_text: { text: altText } }

        bot.post('media/metadata/create', meta_params, function (err, data, response) {
          if (!err) {
            // now we can reference the media and post a tweet (media will attach to the tweet)
            var params = { status: 'loving life #nofilter', media_ids: [mediaIdStr] }

            bot.post('statuses/update', params, function (err, data, response) {
              console.log(data)
            })
          }
        })
      })

    })
  },
  simpleSheet: true
})
*/
