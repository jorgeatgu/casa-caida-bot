#!/usr/local/bin/bash

# huesca=('Abiego' 'Abizanda' 'Adahuesca' 'Aguero' 'Aisa' 'AlbalatedeCinca' 'Albalatillo' 'Albelda' 'AlberoAlto' 'AlberoBajo' 'AlberueladeTubo' 'AlcaladeGurrea' 'AlcaladelObispo' 'Alcampell' 'AlcoleadeCinca' 'Alcubierre' 'Alerre' 'Alfantega' 'Almudevar' 'AlmuniadeSanJuan' 'Almuniente' 'Alquezar' 'Altorricon' 'Angues' 'Anso' 'Antillon' 'AraguesdelPuerto' 'Aren' 'Argavieso' 'Arguis' 'Ayerbe' 'Azanuy-Alins' 'Azara' 'Azlor' 'Baells' 'Bailo' 'Baldellou' 'Ballobar' 'Banastas' 'Barbastro' 'Barbues' 'Barbunales' 'Barcabo' 'BelverdeCinca' 'Benabarre' 'Benasque' 'Berbegal' 'Bielsa' 'Bierge' 'Biescas' 'Binaced' 'Binefar' 'Bisaurri' 'Biscarrues' 'BlecuayTorres' 'Boltana' 'Bonansa' 'Borau' 'Broto' 'Caldearenas' 'Campo' 'Camporrells' 'CanaldeBerdun' 'Candasnos' 'Canfranc' 'Capdesaso' 'Capella' 'CasbasdeHuesca' 'CastejondelPuente' 'CastejondeMonegros' 'CastejondeSos' 'Castelflorite' 'CastiellodeJaca' 'Castigaleu' 'Castillazuelo' 'Castillonroy' 'Colungo' 'Chalamera' 'Chia' 'Chimillas' 'Esplus' 'Estada' 'Estadilla' 'EstopinandelCastillo' 'Fago' 'Fanlo' 'Fiscal' 'Fonz' 'ForadadadelToscar' 'Fraga' 'LaFueva' 'Gistain' 'ElGrado' 'Granen' 'Graus' 'GurreadeGallego' 'HozdeJaca' 'Huerto' 'Huesca' 'Ibieca' 'Igries' 'Ilche' 'Isabena' 'Jaca' 'Jasa' 'Labuerda' 'Laluenga' 'Lalueza' 'Lanaja' 'Laperdiguera' 'LascellasPonzano' 'Lascuarre' 'Laspaules' 'Laspuea' 'Loarre' 'Loporzano' 'Loscorrales' 'MonesmayCajigar' 'MonfloriteLascasas' 'Montanuy' 'Monzon' 'Naval' 'Novales' 'Nueno' 'Olvena' 'Ontinena' 'OssodeCinca' 'Palo' 'Panticosa' 'Penalba' 'LasPenasdeRiglos' 'PeraltadeAlcofea' 'PeraltadeCalasanz' 'Peraltilla' 'Perarrua' 'Pertusa' 'Piraces' 'Plan' 'Polenino' 'PozandeVero' 'LaPuebladeCastro' 'PuentedeMontanana' 'Puertolas' 'ElPueyodeAraguas' 'PueyodeSantaCruz' 'Quicena' 'Robres' 'Sabinanigo' 'Sahun' 'SalasAltas' 'SalasBajas' 'Salillas' 'SallentdeGallego' 'SanEstebandeLitera' 'Sangarren' 'SanJuandePlan' 'SantaCilia' 'SantaCruzdeLaSeros' 'SantaliestraySanQuilez' 'Sarinena' 'Secastilla' 'Seira' 'Sena' 'SenesdeAlcubierre' 'Sesa' 'Sesue' 'Sietamo' 'Sopeira' 'TamaritedeLitera' 'Tardienta' 'Tella-Sin' 'Tierz' 'Tolva' 'Torla-Ordesa' 'TorralbadeAragon' 'TorreLaRibera' 'TorrentedeCinca' 'TorresdeAlcanadre' 'TorresdeBarbues' 'Tramaced' 'Valfarta' 'ValledeBardaji' 'ValledeLierp' 'VelilladeCinca' 'Beranuy' 'ViacampyLitera' 'Vicien' 'Villanova' 'Villanua' 'VillanuevadeSigena' 'YebradeBasa' 'Yesero' 'Zaidin' 'ValledeHecho' 'PuenteLaReinadeJaca' 'SanMigueldelCinca' 'LaSotonera' 'Lupinen-Ortilla' 'SantaMariadeDulcis' 'Ainsa-Sobrarbe' 'HozyCostean' )

# teruel=('Ababuj' 'Abejuela' 'Aguaton' 'Aguaviva' 'AguilardelAlfambra' 'Alacon' 'Alba' 'AlbalatedelArzobispo' 'Albarracin' 'Albentosa' 'Alcaine' 'AlcaladeLaSelva' 'Alcaniz' 'Alcorisa' 'Alfambra' 'Aliaga' 'Almohaja' 'Alobras' 'Alpenes' 'Allepuz' 'Alloza' 'Allueva' 'Anadon' 'Andorra' 'ArcosdeLasSalinas' 'ArensdeLledo' 'Argente' 'Arino' 'Azaila' 'Badenas' 'Baguena' 'Banon' 'Barrachina' 'Bea' 'Beceite' 'BelmontedeSanJose' 'Bello' 'Berge' 'Bezas' 'Blancas' 'Blesa' 'Bordon' 'Bronchales' 'Buena' 'Burbaguena' 'CabradeMora' 'Calaceite' 'Calamocha' 'Calanda' 'Calomarde' 'Camanas' 'CamarenadeLaSierra' 'Camarillas' 'Caminreal' 'Cantavieja' 'CanadadeBenatanduz' 'LaCanadadeVerich' 'CanadaVellida' 'CanizardelOlivar' 'CascantedelRio' 'CastejondeTornos' 'CasteldeCabra' 'Castelnou' 'Castelseras' 'ElCastellar' 'Castellote' 'Cedrillas' 'Celadas' 'Cella' 'LaCerollera' 'LaCodonera' 'Corbalan' 'CortesdeAragon' 'Cosa' 'Cretas' 'Crivillen' 'LaCuba' 'Cubla' 'Cucalon' 'ElCuervo' 'CuevasdeAlmuden' 'CuevasLabradas' 'Ejulve' 'Escorihuela' 'Escucha' 'Estercuel' 'FerrerueladeHuerva' 'Fonfria' 'FormicheAlto' 'Fornoles' 'Fortanete' 'Foz-Calanda' 'LaFresneda' 'FriasdeAlbarraci­n' 'Fuenferrada' 'FuentesCalientes' 'FuentesClaras' 'FuentesdeRubielos' 'Fuentespalda' 'Galve' 'Gargallo' 'GeadeAlbarracin' 'LaGinebrosa' 'Griegos' 'Guadalaviar' 'Gudar' 'Hijar' 'HinojosadeJarque' 'LaHozdeLaVieja' 'HuesadelComun' 'LaIglesueladelCid' 'Jabaloyas' 'JarquedeLaVal' 'Jatiel' 'Jorcas' 'Josa' 'Lagueruela' 'Lanzuela' 'Libros' 'Lidon' 'LinaresdeMora' 'Loscos' 'Lledo' 'Maicas' 'Manzanera' 'MartindelRio' 'MasdeLasMatas' 'LaMatadeLosOlmos' 'Mazaleon' 'MezquitadeJarque' 'Mirambel' 'MiravetedeLaSierra' 'Molinos' 'MonfortedeMoyuela' 'MonrealdelCampo' 'Monroyo' 'Montalban' 'MonteagudodelCastillo' 'MonterdedeAlbarracin' 'MoradeRubielos' 'Moscardon' 'Mosqueruela' 'Muniesa' 'NogueradeAlbarracin' 'Nogueras' 'Nogueruelas' 'Obon' 'Odon' 'OjosNegros' 'Olba' 'Oliete' 'LosOlmos' 'OrihueladelTremedal' 'Orrios' 'PalomardeArroyos' 'Pancrudo' 'LasParrasdeCastellote' 'PenarroyadeTastavins' 'Peracense' 'Peralejos' 'PeralesdelAlfambra' 'Pitarque' 'Plou' 'ElPobo' 'LaPortellada' 'Pozondon' 'PozueldelCampo' 'LaPuebladeHijar' 'LaPuebladeValverde' 'Puertomingalvo' 'Rafales' 'Rillo' 'Riodeva' 'Rodenas' 'Royuela' 'Rubiales' 'RubielosdeLaCerida' 'RubielosdeMora' 'Salcedillo' 'Saldon' 'SamperdeCalanda' 'SanAgustin' 'SanMartindelRio' 'SantaCruzdeNogueras' 'SantaEulalia' 'Sarrion' 'SeguradeLosBanos' 'Seno' 'Singra' 'Terriente' 'Teruel' 'TorilyMasegoso' 'Tormon' 'Tornos' 'TorralbadeLosSisones' 'TorrecilladeAlcaniz' 'TorrecilladelRebollar' 'TorredeArcas' 'TorredeLasArcas' 'TorredelCompte' 'Torrelacarcel' 'TorreLosNegros' 'TorremochadeJiloca' 'TorresdeAlbarracin' 'Torrevelilla' 'Torrijas' 'TorrijodelCampo' 'Tramacastiel' 'Tramacastilla' 'Tronchon' 'UrreadeGaen' 'Utrillas' 'Valacloche' 'Valbona' 'Valdealgorfa' 'Valdecuenca' 'Valdelinares' 'Valdeltormo' 'Valderrobres' 'Valjunquera' 'ElVallecillo' 'VeguillasdeLaSierra' 'VillafrancadelCampo' 'VillahermosadelCampo' 'VillanuevadelRebollardeLaSierra' 'VillardelCobo' 'VillardelSalz' 'Villarluengo' 'Villarquemado' 'VillarroyadeLosPinares' 'Villastar' 'Villel' 'Vinaceite' 'Visiedo' 'ViveldelRioMartin' 'LaZoma')

zaragoza=('Abanto' 'Acered' 'Agon' 'Aguaron' 'Aguilon' 'Ainzon' 'Aladren' 'Alagon' 'Alarba' 'AlberitedeSanJuan' 'Albeta' 'Alborge' 'AlcaladeEbro' 'AlcaladeMoncayo' 'AlconcheldeAriza' 'AldehueladeLiestos' 'Alfajarin' 'Alfamen' 'Alforque' 'AlhamadeAragon' 'Almochuel' 'LaAlmolda' 'AlmonaciddeLaCuba' 'AlmonaciddeLaSierra' 'LaAlmuniadeDonaGodina' 'Alpartir' 'Ambel' 'Anento' 'Aninon' 'AnondeMoncayo' 'ArandadeMoncayo' 'Arandiga' 'Ardisa' 'Ariza' 'Artieda' 'Asi­n' 'Atea' 'Ateca' 'Azuara' 'Badules' 'Bagues' 'Balconchan' 'Barboles' 'Bardallur' 'Belchite' 'BelmontedeGracian' 'Berdejo' 'Berrueco' 'Bijuesca' 'Biota' 'Bisimbre' 'Boquineni' 'Bordalba' 'Borja' 'Botorrita' 'BreadeAragon' 'Bubierca' 'Bujaraloz' 'Bulbuente' 'Bureta' 'ElBurgodeEbro' 'ElBuste' 'CabanasdeEbro' 'Cabolafuente' 'Cadrete' 'Calatayud' 'Calatorao' 'Calcena' 'Calmarza' 'CampillodeAragon' 'Carenas' 'Carinena' 'Caspe' 'CastejondeAlarba' 'CastejondeLasArmas' 'CastejondeValdejasa' 'Castiliscar' 'CerveradeLaCanada' 'Cerveruela' 'Cetina' 'Cimballa' 'CincoOlivas' 'ClaresdeRibota' 'Codo' 'Codos' 'Contamina' 'Cosuenda' 'CuartedeHuerva' 'Cubel' 'LasCuerlas' 'Chiprana' 'Chodes' 'Daroca' 'EjeadeLosCaballeros' 'EmbiddeAriza' 'Encinacorba' 'epila' 'Erla' 'Escatron' 'Fabara' 'Farlete' 'Fayon' 'LosFayos' 'Figueruelas' 'Fombuena' 'ElFrago' 'ElFrasno' 'Frescano' 'Fuendejalon' 'Fuendetodos' 'FuentesdeEbro' 'FuentesdeJiloca' 'Gallocanta' 'Gallur' 'Gelsa' 'Godojos' 'Gotor' 'Grisel' 'Grisen' 'HerreradeLosNavarros' 'Ibdes' 'Illueca' 'Isuerre' 'Jaraba' 'Jarque' 'Jauli­n' 'LaJoyosa' 'Lagata' 'LangadelCastillo' 'Layana' 'Lecera' 'Lecinena' 'Lechon' 'Letux' 'Litago' 'Lituenigo' 'LoberadeOnsella' 'Longares' 'Longas' 'LucenadeJalon' 'Luceni' 'Luesia' 'Luesma' 'Lumpiaque' 'Luna' 'Maella' 'Magallon' 'Mainar' 'Malanquilla' 'Malejan' 'Malon' 'Maluenda' 'Mallen' 'Manchones' 'Mara' 'MariadeHuerva' 'MedianadeAragon' 'Mequinenza' 'MesonesdeIsuela' 'Mezalocha' 'Mianos' 'MiedesdeAragon' 'Monegrillo' 'Moneva' 'MonrealdeAriza' 'Monterde' 'Monton' 'MoratadeJalon' 'MoratadeJiloca' 'Mores' 'Moros' 'Moyuela' 'Mozota' 'Muel' 'LaMuela' 'Munebrega' 'Murero' 'MurillodeGallego' 'Navardún' 'Niguella' 'Nombrevilla' 'Nonaspe' 'Novallas' 'Novillas' 'Nuevalos' 'NuezdeEbro' 'Olves' 'Orcajo' 'Orera' 'Ores' 'Oseja' 'OseradeEbro' 'Paniza' 'ParacuellosdeJiloca' 'ParacuellosdeLaRibera' 'Pastriz' 'Pedrola' 'LasPedrosas' 'Perdiguera' 'Piedratajada' 'PinadeEbro' 'Pinseque' 'LosPintanos' 'PlasenciadeJalon' 'Pleitas' 'Plenas' 'Pomer' 'PozueldeAriza' 'PozuelodeAragon' 'PradilladeEbro' 'PuebladeAlborton' 'LaPuebladeAlfinden' 'Puendeluna' 'Purujosa' 'Quinto' 'Remolinos' 'Retascon' 'Ricla' 'Romanos' 'RuedadeJalon' 'Ruesca' 'Sadaba' 'SalillasdeJalon' 'SalvatierradeEsca' 'SamperdelSalz' 'SanMartindeLaVirgendeMoncayo' 'SanMateodeGallego' 'SantaCruzdeGrÃ­o' 'SantaCruzdeMoncayo' 'SantaEulaliadeGallego' 'Santed' 'Sastago' 'Savinan' 'Sediles' 'Sestrica' 'SierradeLuna' 'Sigües' 'Sisamon' 'Sobradiel' 'SosdelReyCatolico' 'Tabuenca' 'Talamantes' 'Tarazona' 'Tauste' 'Terrer' 'Tierga' 'Tobed' 'TorralbadeLosFrailes' 'TorralbadeRibota' 'Torralbilla' 'Torrehermosa' 'Torrelapaja' 'Torrellas' 'TorresdeBerrellen' 'TorrijodeLaCanada' 'Tosos' 'Trasmoz' 'Trasobares' 'Uncastillo' 'UnduesdeLerda' 'UrreadeJalon' 'Urries' 'Used' 'Utebo' 'Valdehorna' 'ValdeSanMarti­n' 'Valmadrid' 'Valpalmas' 'Valtorres' 'VelilladeEbro' 'VelilladeJiloca' 'VeradeMoncayo' 'Vierlas' 'LaViluena' 'Villadoz' 'Villafeliche' 'VillafrancadeEbro' 'VillalbadePerejil' 'Villalengua' 'VillanuevadeGallego' 'VillanuevadeJiloca' 'VillanuevadeHuerva' 'VillardeLosNavarros' 'VillarrealdeHuerva' 'VillarroyadeLaSierra' 'VillarroyadelCampo' 'Vistabella' 'LaZaida' 'Zaragoza' 'Zuera' 'Biel' 'Marracos' 'VillamayordeGallego')

sleep 5s
for ((j = 0; j < ${#zaragoza[@]}; j++)); do
    screencapture -T 3 -D2 -R815,130,950,820 ~/github/twitter-bot/images/"${zaragoza[$j]}".jpg
done
