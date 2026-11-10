# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

neighborhoods = [
  {
    name: "Kagurazaka",
    hashtag: "#kagurazaka",
    description: "Kagurazaka sits on the ridge between Iidabashi and Ushigome. Stone slopes and narrow lanes remain between small publishers, restaurants, and low residential buildings. The main slope has the shops; the back streets stay quiet after dinner.",
    hashtag_description: "Stone slopes and a former geisha quarter that still keeps its evenings quiet.",
    city: "Tokyo",
    tags: "historic, quiet, residential, dining, slopes"
  },
  {
    name: "Yanaka",
    hashtag: "#yanaka",
    description: "Yanaka kept much of its street pattern through the 1923 earthquake and the war. Temples, wooden houses, galleries, and the short Yanaka Ginza shopping street share a low skyline. It is a walking neighborhood, with commerce at the scale of a gallery or a corner shop.",
    hashtag_description: "A temple town of wooden houses and graveled lanes with a low skyline.",
    city: "Tokyo",
    tags: "historic, quiet, temples, residential, shitamachi"
  },
  {
    name: "Nezu",
    hashtag: "#nezu",
    description: "Nezu is the southern piece of Yanesen, the band of Yanaka, Nezu, and Sendagi. Nezu Shrine faces lanes of houses, small restaurants, and a few university buildings. Shops serve the people who live there rather than a passing office crowd.",
    hashtag_description: "A shrine neighborhood of residential lanes just south of Yanaka.",
    city: "Tokyo",
    tags: "historic, quiet, shrine, residential, yanesen"
  },
  {
    name: "Sendagi",
    hashtag: "#sendagi",
    description: "Sendagi is the residential end of Yanesen. Houses face narrow streets, a few old kissaten remain, and the slope toward Nezu is lined with everyday shops. There is little through traffic, and the streets empty early.",
    hashtag_description: "The residential end of Yanesen, with local shops and little through traffic.",
    city: "Tokyo",
    tags: "historic, quiet, residential, yanesen, local-shops"
  },
  {
    name: "Negishi",
    hashtag: "#negishi",
    description: "Negishi was a Meiji literati quarter between Nippori and Ueno, where writers and painters kept houses away from the denser city. The lanes are still low and residential, with a handful of long-running shops and no commercial strip. It is one of the easiest historic neighborhoods in Tokyo to miss.",
    hashtag_description: "A former literati quarter that is still quiet east of Ueno.",
    city: "Tokyo",
    tags: "historic, quiet, residential, literary, shitamachi"
  },
  {
    name: "Hongo",
    hashtag: "#hongo",
    description: "Hongo held daimyo estates in the Edo period and later became the neighborhood of the University of Tokyo. Buses run on the avenues; the lanes behind Hongo-sanchome are houses, old bookshops, and small offices. It functions as a business-residential quarter without a downtown of towers.",
    hashtag_description: "Former estate land turned into a university neighborhood of bookshops and side streets.",
    city: "Tokyo",
    tags: "historic, quiet, university, residential, bookshops"
  },
  {
    name: "Yushima",
    hashtag: "#yushima",
    description: "Yushima Tenmangu and the Confucian hall of Yushima Seido anchor a slope of clinics, small offices, and apartments. The shrine approach draws foot traffic, then the side streets return to residences. Business here is local and low-rise.",
    hashtag_description: "A shrine slope between universities, with homes above the side-street shops.",
    city: "Tokyo",
    tags: "historic, quiet, shrine, residential, university"
  },
  {
    name: "Kohinata",
    hashtag: "#kohinata",
    description: "Kohinata is a steep residential hill between Kagurazaka and the Edogawa. Houses, a few restaurants, and small professional offices share the slope, with almost no chain retail. It grew up at the edge of Ushigome and never took on Kagurazaka’s evening trade.",
    hashtag_description: "A steep residential slope between Kagurazaka and the Edogawa.",
    city: "Tokyo",
    tags: "historic, quiet, slopes, residential, lanes"
  },
  {
    name: "Koishikawa",
    hashtag: "#koishikawa",
    description: "Koishikawa sits beside Koishikawa Korakuen, the seventeenth-century garden of the Mito Tokugawa house. Apartments, clinics, and low offices fill the streets around the garden toward Hakusan. The work here is local: medicine, printing, and small firms.",
    hashtag_description: "Garden-side streets on land once held by the Mito Tokugawa house.",
    city: "Tokyo",
    tags: "historic, quiet, gardens, residential, local-business"
  },
  {
    name: "Bancho",
    hashtag: "#bancho",
    description: "Bancho, the numbered blocks from Ichibancho to Rokubancho, was built as housing for shogunal retainers. The grid is still low beside the government quarter. Schools, law offices, embassies, and apartment houses share tree-lined streets that go quiet at night.",
    hashtag_description: "The old hatamoto quarters of Chiyoda, now homes, schools, and small offices.",
    city: "Tokyo",
    tags: "historic, quiet, residential, offices, chiyoda"
  },
  {
    name: "Ningyocho",
    hashtag: "#ningyocho",
    description: "Ningyocho supplied dolls and festival goods from the Edo period and kept a tight grid of narrow commercial streets. Restaurants and long-running wholesalers face the lanes, with apartments above the shops and on the blocks behind Amazake-yokocho. Lunch is the busy hour; nights are calm.",
    hashtag_description: "An Edo merchant town of doll makers and wholesalers, with apartments above the shops.",
    city: "Tokyo",
    tags: "historic, quiet, merchant, dining, shitamachi"
  },
  {
    name: "Monzen-nakacho",
    hashtag: "#monzennakacho",
    description: "The name means the town in front of the gate, here the approach to Tomioka Hachimangu in Fukagawa. The shopping street is short and local, and the surrounding blocks are houses and apartments. Small businesses serve residents, and the side streets are still once the shops close.",
    hashtag_description: "The approach to Tomioka Hachimangu, a temple-gate town that stayed residential.",
    city: "Tokyo",
    tags: "historic, quiet, shrine, residential, fukagawa"
  },
  {
    name: "Kiyosumi-Shirakawa",
    hashtag: "#kiyosumishirakawa",
    description: "Kiyosumi was a storeyard for timber brought in by river. The Iwasaki garden remains, and former warehouses now hold galleries and small offices. Apartment streets run out to the canals. It is a business-residential quarter that never grew a commercial center.",
    hashtag_description: "Former lumber warehouses turned into a quiet quarter of gardens and galleries.",
    city: "Tokyo",
    tags: "historic, quiet, canals, galleries, residential"
  },
  {
    name: "Kuramae",
    hashtag: "#kuramae",
    description: "Kuramae supplied leather and festival goods to the trades around Asakusa. Workshops and showrooms still occupy low buildings, and apartments fill the back streets toward the Sumida. It sits beside tourist Asakusa and stays noticeably calmer.",
    hashtag_description: "A craft-wholesale district behind Asakusa, residential off the main street.",
    city: "Tokyo",
    tags: "historic, quiet, craft, residential, warehouses"
  },
  {
    name: "Shirokane",
    hashtag: "#shirokane",
    description: "Shirokane took its character from Meiji estates, when large houses replaced farmland on this high ground in Minato. Shirokane and Shirokanedai are still low and green. Clinics, embassies, and small offices sit among houses, and through traffic stays on Meguro-dori.",
    hashtag_description: "A Meiji estate district that is still one of Tokyo’s quietest residential neighborhoods.",
    city: "Tokyo",
    tags: "historic, quiet, residential, gardens, local-business"
  },
  {
    name: "Mejiro",
    hashtag: "#mejiro",
    description: "Mejiro grew around the Gakushuin school and the old Mejiro palace grounds. Houses and small offices sit behind hedges on streets that rarely carry through traffic. The station is busy; two blocks away the neighborhood is residential.",
    hashtag_description: "A school quarter of hedges and low houses west of Ikebukuro.",
    city: "Tokyo",
    tags: "historic, quiet, residential, schools, gardens"
  },
  {
    name: "Zoshigaya",
    hashtag: "#zoshigaya",
    description: "Zoshigaya is known for Kishimojin-do and the missionary schools that settled beside it. The lanes are residential, with a few long-running shops and a cemetery that keeps the blocks low. It sits near Ikebukuro and does not share that station's noise.",
    hashtag_description: "A temple and school neighborhood whose lanes stay residential.",
    city: "Tokyo",
    tags: "historic, quiet, temples, residential, schools"
  },
  {
    name: "Mukojima",
    hashtag: "#mukojima",
    description: "Mukojima faces Asakusa from the far bank of the Sumida. Temples and old houses replaced the Edo leisure boats, and the streets are now apartments and local shops. The river path is the busiest part; the interior blocks are calm.",
    hashtag_description: "Temple streets on the Sumida bank opposite Asakusa.",
    city: "Tokyo",
    tags: "historic, quiet, temples, residential, river"
  },
  {
    name: "Kyojima",
    hashtag: "#kyojima",
    description: "Kyojima keeps one of the tighter grids of wooden nagaya left in eastern Tokyo. Workshops and small shops occupy the ground floors, and people live above them. The streets are too narrow for much traffic, which is why the quarter stays quiet.",
    hashtag_description: "A wooden nagaya quarter of workshops and upstairs rooms.",
    city: "Tokyo",
    tags: "historic, quiet, shitamachi, residential, workshops"
  },
  {
    name: "Kiba",
    hashtag: "#kiba",
    description: "Kiba stored the timber that built Edo, stacked in ponds along the river. The ponds are parks now, and the blocks around them are apartments and low offices. It is a residential quarter with a working past and no commercial center.",
    hashtag_description: "Former timber ponds turned into a quiet residential park quarter.",
    city: "Tokyo",
    tags: "historic, quiet, parks, residential, warehouses"
  },
  {
    name: "Denenchofu",
    hashtag: "#denenchofu",
    description: "Denenchofu was laid out in the 1920s as a garden suburb, with curved streets and houses set back from the road. Shops stay near the station. The rest of the neighborhood is residential, green, and slow.",
    hashtag_description: "A 1920s garden suburb of curved streets and set-back houses.",
    city: "Tokyo",
    tags: "historic, quiet, gardens, residential, planned"
  },
  {
    name: "Gotokuji",
    hashtag: "#gotokuji",
    description: "Gotokuji takes its name from the temple of the beckoning cat, set back from the Setagaya streets around it. Houses and a few cafes fill the walk from the station. After the temple gate, the neighborhood is ordinary and quiet.",
    hashtag_description: "A temple town in Setagaya that stays residential past the gate.",
    city: "Tokyo",
    tags: "historic, quiet, temples, residential, setagaya"
  },
  {
    name: "Nishi-Ogikubo",
    hashtag: "#nishiogikubo",
    description: "Nishi-Ogikubo is a low residential neighborhood in Suginami with a short street of antique and secondhand shops. The shops close early. Side streets are houses, small offices, and almost no nightlife.",
    hashtag_description: "A residential Suginami quarter with a short antique street.",
    city: "Tokyo",
    tags: "historic, quiet, residential, antiques, local-shops"
  },
  {
    name: "Takanawa",
    hashtag: "#takanawa",
    description: "Takanawa lined the old Tokaido out of Edo, and Sengakuji, the temple of the forty-seven ronin, still anchors it. Temples, houses, and a few hotels share the hill above Shinagawa. The back streets are quieter than the station below.",
    hashtag_description: "A temple hill above Shinagawa on the old Tokaido.",
    city: "Tokyo",
    tags: "historic, quiet, temples, residential, tokaido"
  },
  {
    name: "Azabu-Juban",
    hashtag: "#azabujuban",
    description: "Azabu-Juban was a town of townhouses serving the Azabu estates, and its shopping street still runs at that scale. Apartments and houses fill the blocks behind the shops. The street is social in the evening; the lanes off it are not.",
    hashtag_description: "An old market street with quiet residential lanes behind the shops.",
    city: "Tokyo",
    tags: "historic, quiet, residential, shopping, minato"
  },
  {
    name: "Iriya",
    hashtag: "#iriya",
    description: "Iriya is a shitamachi neighborhood north of Asakusa, residential once you leave the station road. Kishimojin's smaller shrines and long-running shops sit among houses. It does not draw the crowds that stop one station south.",
    hashtag_description: "A residential shitamachi pocket north of Asakusa.",
    city: "Tokyo",
    tags: "historic, quiet, shitamachi, residential, local-shops"
  },
  {
    name: "Hakusan",
    hashtag: "#hakusan",
    description: "Hakusan sits below Koishikawa, a slope of houses, clinics, and small offices around Hakusan Shrine. The shopping street is short and local. Students pass through; the people who stay live on the side streets.",
    hashtag_description: "A shrine slope of houses and clinics below Koishikawa.",
    city: "Tokyo",
    tags: "historic, quiet, shrine, residential, local-business"
  },
  {
    name: "Komagome",
    hashtag: "#komagome",
    description: "Komagome is the neighborhood of Rikugien, the Edo strolling garden, and of houses built later on the surrounding high ground. Cafes cluster near the garden gate. The rest is residential and shaded.",
    hashtag_description: "Garden-side houses on the high ground around Rikugien.",
    city: "Tokyo",
    tags: "historic, quiet, gardens, residential, shrine"
  },
  {
    name: "Todoroki",
    hashtag: "#todoroki",
    description: "Todoroki is a valley neighborhood in Setagaya, known for its ravine and a small temple at the bottom. Houses follow the ridge, and the walk down to the stream leaves the traffic behind. Shops are few and close to the station.",
    hashtag_description: "A ravine neighborhood where houses sit above a quiet stream.",
    city: "Tokyo",
    tags: "historic, quiet, valley, residential, temples"
  },
  {
    name: "Kuhonbutsu",
    hashtag: "#kuhonbutsu",
    description: "Kuhonbutsu grew around a temple of nine Buddhas on the Setagaya plateau. The approach is a short shopping street, and the blocks beyond it are houses with gardens. It is one of the calmer residential pockets in the west of the city.",
    hashtag_description: "A temple approach and garden houses on the Setagaya plateau.",
    city: "Tokyo",
    tags: "historic, quiet, temples, residential, gardens"
  },
  {
    name: "Morishita",
    hashtag: "#morishita",
    description: "Morishita is a Fukagawa residential neighborhood beside the approach to Tomioka Hachimangu. Low offices and apartments replaced older warehouses, but the streets stay narrow. Local restaurants serve the block, not a destination crowd.",
    hashtag_description: "A Fukagawa residential block beside the shrine approach.",
    city: "Tokyo",
    tags: "historic, quiet, fukagawa, residential, local-business"
  },
  {
    name: "Hamacho",
    hashtag: "#hamacho",
    description: "Hamacho sits at the quiet end of Nihonbashi, by a park that was once a residence. Apartments, small wholesalers, and a few restaurants share a low grid. It is close to Ningyocho and much less walked.",
    hashtag_description: "A low Nihonbashi grid of apartments and small wholesalers.",
    city: "Tokyo",
    tags: "historic, quiet, residential, merchant, parks"
  },
  {
    name: "Tabata",
    hashtag: "#tabata",
    description: "Tabata is a residential neighborhood north of Ueno, with a slope of houses running down from the station. A few old restaurants and shops serve the hill. The freight tracks nearby keep larger development off the lanes.",
    hashtag_description: "A residential hill north of Ueno, off the main streets.",
    city: "Tokyo",
    tags: "historic, quiet, residential, slopes, local-shops"
  },
  {
    name: "Oji",
    hashtag: "#oji",
    description: "Oji was a paper-making town on the Shakujii river, and Oji Shrine still marks the old center. The station area has shops; the streets toward the shrine and the river are houses and small factories. Evenings belong to the neighborhood.",
    hashtag_description: "A former paper town of houses, a shrine, and small factories.",
    city: "Tokyo",
    tags: "historic, quiet, shrine, residential, workshops"
  },
  {
    name: "Minami-Azabu",
    hashtag: "#minamiazabu",
    description: "Minami-Azabu is a residential hill of embassies, schools, and houses between Hiroo and Azabu-Juban. Offices are small and set back from the street. The avenues carry cars; the cross streets are quiet enough to walk at night.",
    hashtag_description: "An embassy hill of houses and small offices above Azabu.",
    city: "Tokyo",
    tags: "historic, quiet, residential, embassies, minato"
  }
]

neighborhoods.each do |attrs|
  neighborhood = Neighborhood.find_or_initialize_by(name: attrs[:name])
  neighborhood.update!(attrs)
end

properties = [
  {
    name: "Hatchobori",
    address: "1 Chome-9-10 Irifune, Chuo City, Tokyo 104-0042",
    description: "\"The thoughtful space to come home to,\" a quieter residential pocket near Ginza and Tokyo Station."
  },
  {
    name: "Kagurazaka",
    address: "2 Chome-12-8 Kagurazaka, Shinjuku City, Tokyo 162-0825",
    description: "\"A house on the slope,\" a calm stay above the stone lanes between Iidabashi and the old geisha quarter.",
    neighborhood: "Kagurazaka"
  },
  {
    name: "Yanaka",
    address: "3 Chome-6-12 Yanaka, Taito City, Tokyo 110-0001",
    description: "\"Slow mornings by the temples,\" a low residential block among wooden houses and Yanaka's back streets.",
    neighborhood: "Yanaka"
  },
  {
    name: "Nezu",
    address: "2 Chome-4-8 Nezu, Bunkyo City, Tokyo 113-0031",
    description: "\"Home beside the shrine path,\" a quiet apartment street a short walk from Nezu Shrine.",
    neighborhood: "Nezu"
  },
  {
    name: "Ningyocho",
    address: "2 Chome-6-1 Nihonbashi Ningyocho, Chuo City, Tokyo 103-0013",
    description: "\"Above the merchant lanes,\" a residential pause in the Edo grid of shops near Nihonbashi.",
    neighborhood: "Ningyocho"
  },
  {
    name: "Monzen-nakacho",
    address: "1 Chome-15-7 Tomioka, Koto City, Tokyo 135-0047",
    description: "\"The gate-town stay,\" a residential block on the approach to Tomioka Hachimangu in Fukagawa.",
    neighborhood: "Monzen-nakacho"
  },
  {
    name: "Kiyosumi",
    address: "2 Chome-8-13 Kiyosumi, Koto City, Tokyo 135-0024",
    description: "\"A canal-side room,\" a quieter warehouse quarter of gardens and small galleries east of the Sumida.",
    neighborhood: "Kiyosumi-Shirakawa"
  },
  {
    name: "Kuramae",
    address: "2 Chome-11-4 Kuramae, Taito City, Tokyo 111-0051",
    description: "\"The craft district, after hours,\" a low residential street of workshops just behind Asakusa.",
    neighborhood: "Kuramae"
  },
  {
    name: "Hongo",
    address: "5 Chome-24-7 Hongo, Bunkyo City, Tokyo 113-0033",
    description: "\"A study in quiet,\" a side-street stay among bookshops and houses near the university.",
    neighborhood: "Hongo"
  },
  {
    name: "Bancho",
    address: "4 Chome-2 Ichibancho, Chiyoda City, Tokyo 102-0082",
    description: "\"The leafy block,\" a low residential grid of former samurai quarters beside the government district.",
    neighborhood: "Bancho"
  },
  {
    name: "Shirokane",
    address: "4 Chome-3-5 Shirokane, Minato City, Tokyo 108-0072",
    description: "\"Green and unhurried,\" a residential estate neighborhood of gardens between Hiroo and Meguro.",
    neighborhood: "Shirokane"
  },
  {
    name: "Azabu-Juban",
    address: "1 Chome-7-3 Azabujuban, Minato City, Tokyo 106-0045",
    description: "\"Off the shopping street,\" a quieter residential lane beside Azabu-Juban's old market town."
  }
]

properties.each do |attrs|
  neighborhood_name = attrs[:neighborhood]
  property = Property.find_or_initialize_by(name: attrs[:name])
  property.update!(attrs.except(:neighborhood))

  next unless neighborhood_name

  neighborhood = Neighborhood.find_by!(name: neighborhood_name)
  property.neighborhoods << neighborhood unless property.neighborhoods.exists?(id: neighborhood.id)
end

{
  "Mejiro" => "Kagurazaka",
  "Zoshigaya" => "Yanaka",
  "Mukojima" => "Kuramae",
  "Kyojima" => "Kuramae",
  "Kiba" => "Kiyosumi",
  "Denenchofu" => "Shirokane",
  "Gotokuji" => "Shirokane",
  "Nishi-Ogikubo" => "Hongo",
  "Takanawa" => "Azabu-Juban",
  "Azabu-Juban" => "Azabu-Juban",
  "Iriya" => "Yanaka",
  "Hakusan" => "Nezu",
  "Komagome" => "Nezu",
  "Todoroki" => "Bancho",
  "Kuhonbutsu" => "Bancho",
  "Morishita" => "Monzen-nakacho",
  "Hamacho" => "Hatchobori",
  "Tabata" => "Hongo",
  "Oji" => "Ningyocho",
  "Minami-Azabu" => "Hatchobori"
}.each do |neighborhood_name, property_name|
  neighborhood = Neighborhood.find_by!(name: neighborhood_name)
  property = Property.find_by!(name: property_name)
  property.neighborhoods << neighborhood unless property.neighborhoods.exists?(id: neighborhood.id)
end

establishment_categories = [
  "Food & Drink",
  "Shopping",
  "Arts & Culture",
  "Cafes",
  "Wellness"
]

establishment_categories.each do |name|
  EstablishmentCategory.find_or_create_by!(name: name)
end

establishments = [
  { name: "Akai Bench Coffee", category: "Cafes", tags: "Cafes", neighborhoods: ["Yanaka", "Nezu"], slug: "akai-bench-coffee",
    short: "Craft matcha latte poured in a former neighborhood shop.",
    long: "You can't miss the bright red bench outside this cafe. The menu stays small: seasonal lattes, hot spiced cider, and a quiet seat facing the lane." },
  { name: "Slope Kissaten", category: "Cafes", tags: "Cafes", neighborhoods: ["Kagurazaka", "Kohinata"], slug: "slope-kissaten",
    short: "A one-room coffee counter halfway up the Kagurazaka slope.",
    long: "The shop occupies a former stationer, with four seats at the window and a hand-written menu. Regulars come for pour-over and leave before the dinner streets fill." },
  { name: "Sendagi Morning", category: "Cafes", tags: "Cafes", neighborhoods: ["Sendagi", "Yanaka"], slug: "sendagi-morning",
    short: "Toast and filter coffee on a residential corner in Sendagi.",
    long: "The cafe opens early and closes before dusk. Benches sit under the eaves, and the baker next door supplies the morning loaf." },
  { name: "Nezu Shrine Coffee", category: "Cafes", tags: "Cafes", neighborhoods: ["Nezu"], slug: "nezu-shrine-coffee",
    short: "A tiny espresso bar on the walk up to Nezu Shrine.",
    long: "There is no sign larger than a noren. Guests drink at a cedar counter while the shrine path stays a block away." },
  { name: "Hongo Page Brew", category: "Cafes", tags: "Cafes", neighborhoods: ["Hongo", "Yushima"], slug: "hongo-page-brew",
    short: "Coffee served between secondhand bookshops in Hongo.",
    long: "Readers leave their bags under the counter and stay for one cup. The owner prints a short reading list beside the beans each week." },
  { name: "Canal Milk Bar", category: "Cafes", tags: "Cafes", neighborhoods: ["Kiyosumi-Shirakawa"], slug: "canal-milk-bar",
    short: "Milk drinks and cake in a converted lumber warehouse.",
    long: "The room faces the canal, with one long table and a pastry case that empties by midafternoon. It is a cafe, not a gallery, though the walls still show the warehouse brick." },
  { name: "Kuramae Toast", category: "Cafes", tags: "Cafes", neighborhoods: ["Kuramae"], slug: "kuramae-toast",
    short: "Thick toast and tea behind the craft wholesalers.",
    long: "Workers from the leather shops stop in before the shutters open. The seating is a single shared table under a paper lantern." },
  { name: "Bancho Window", category: "Cafes", tags: "Cafes", neighborhoods: ["Bancho"], slug: "bancho-window",
    short: "A quiet cafe on a tree-lined Bancho side street.",
    long: "The windows look onto a low residential block, not an avenue. Coffee is the point; the kitchen stops at soup and a daily sandwich." },
  { name: "Shirokane Pour", category: "Cafes", tags: "Cafes", neighborhoods: ["Shirokane"], slug: "shirokane-pour",
    short: "Single-origin coffee in a former estate gatehouse.",
    long: "The room is small, bright, and almost silent. Guests sit with a book while the garden next door does the rest." },
  { name: "Ningyocho Sip", category: "Cafes", tags: "Cafes", neighborhoods: ["Ningyocho"], slug: "ningyocho-sip",
    short: "Afternoon coffee above a doll-parts wholesaler.",
    long: "Climb the narrow stair from Amazake-yokocho and the street noise drops. The menu is coffee, hojicha, and one sweet that changes with the season." },
  { name: "Amazake Counter", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Ningyocho"], slug: "amazake-counter",
    short: "A standing counter for amazake, grilled fish, and rice.",
    long: "The shop has fed the merchant lanes since the block was all wholesalers. Seats turn over quickly, and the kitchen closes when the pot is empty." },
  { name: "Yanaka Soba", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Yanaka", "Sendagi"], slug: "yanaka-soba",
    short: "Handmade soba on a graveled lane behind the temples.",
    long: "There are eight seats and a noren the color of buckwheat. Lunch is noodles; the evening menu adds a small flask of local sake." },
  { name: "Kagura Grill", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Kagurazaka"], slug: "kagura-grill",
    short: "Charcoal grilled fish on a back street off the slope.",
    long: "The room is a former ryotei kitchen, now a short menu of fish, rice, and pickles. Reservations keep the street outside quiet." },
  { name: "Tomioka Diner", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Monzen-nakacho"], slug: "tomioka-diner",
    short: "Home-style set meals a block from the shrine gate.",
    long: "The lunch set is written on a board each morning. Neighbors eat at the counter, and the doors close before the shopping street lights come on." },
  { name: "Kiyosumi Kitchen", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Kiyosumi-Shirakawa", "Monzen-nakacho"], slug: "kiyosumi-kitchen",
    short: "A vegetable-led kitchen in a former storehouse.",
    long: "Produce comes from the morning market and the menu is four plates. The dining room shares a courtyard with a small gallery." },
  { name: "Hongo Teishoku", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Hongo", "Yushima"], slug: "hongo-teishoku",
    short: "A daily set meal for people who live above the bookshops.",
    long: "The cook writes one teishoku at dawn and serves it until the rice is gone. Students and neighbors share the same wooden counter." },
  { name: "Negishi Supper", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Negishi", "Yanaka"], slug: "negishi-supper",
    short: "A six-seat supper room on a lane east of Ueno.",
    long: "Dinner is a short sequence of seasonal dishes, served once each evening. The street outside is residential, and the shop has no street sign." },
  { name: "Bancho Bistro", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Bancho"], slug: "bancho-bistro",
    short: "A small French bistro in a former hatamoto block.",
    long: "The dining room seats twenty and takes one seating at night. The kitchen keeps to a short carte and a quiet room." },
  { name: "Shirokane Table", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Shirokane"], slug: "shirokane-table",
    short: "A neighborhood dining room set back from Meguro-dori.",
    long: "Lunch is a single plate and a pot of tea. In the evening the same kitchen serves a longer menu to the houses around the corner." },
  { name: "Kuramae Yakitori", category: "Food & Drink", tags: "Restaurants", neighborhoods: ["Kuramae"], slug: "kuramae-yakitori",
    short: "Yakitori for the craft workshops after the shutters close.",
    long: "Smoke stays in a back courtyard, not on the shopping street. The counter fits ten, and the last order is early." },
  { name: "Yanaka Paper", category: "Shopping", tags: "Shopping", neighborhoods: ["Yanaka", "Nezu"], slug: "yanaka-paper",
    short: "Letterpress cards and washi in a wooden townhouse.",
    long: "The press sits in the front room, and the paper is sold from drawers along the wall. Visitors are welcome to watch a short run if the printer is working." },
  { name: "Sendagi General", category: "Shopping", tags: "Shopping", neighborhoods: ["Sendagi"], slug: "sendagi-general",
    short: "A household shop selling brushes, soap, and pantry staples.",
    long: "The shelves are low and the stock is what the block actually uses. It has stood on the same corner long enough that regulars still call it by the founder's name." },
  { name: "Kagura Cloth", category: "Shopping", tags: "Shopping", neighborhoods: ["Kagurazaka", "Kohinata"], slug: "kagura-cloth",
    short: "Indigo cloth and mended workwear on the slope.",
    long: "Bolts are stacked on a mezzanine above a single cutting table. The shop also mends pieces brought in from the houses nearby." },
  { name: "Ningyocho Doll House", category: "Shopping", tags: "Shopping", neighborhoods: ["Ningyocho"], slug: "ningyocho-doll-house",
    short: "Festival dolls and small gifts from a long-running wholesaler.",
    long: "The ground floor sells to neighbors; the upper floor still supplies shops across the city. Display cases line a corridor barely wide enough for two people." },
  { name: "Kuramae Leather", category: "Shopping", tags: "Shopping", neighborhoods: ["Kuramae"], slug: "kuramae-leather",
    short: "Small leather goods made in the workshop behind the counter.",
    long: "Belts, card cases, and straps hang on a peg wall. The maker works in sight of the street and will resize a piece while you wait." },
  { name: "Kiyosumi Objects", category: "Shopping", tags: "Shopping", neighborhoods: ["Kiyosumi-Shirakawa"], slug: "kiyosumi-objects",
    short: "Household objects displayed in a former timber office.",
    long: "Ceramics, lamps, and linen are arranged on warehouse shelves. The selection changes slowly, and nothing in the room is a souvenir." },
  { name: "Shirokane Florist", category: "Shopping", tags: "Shopping", neighborhoods: ["Shirokane"], slug: "shirokane-florist",
    short: "A florist cutting stems for the houses on the hill.",
    long: "Bunches are wrapped in plain paper and rarely include a card. The shop also keeps a bucket of branches for people walking home from the station." },
  { name: "Hongo Books", category: "Shopping", tags: "Shopping", neighborhoods: ["Hongo", "Yushima"], slug: "hongo-books",
    short: "Used books in literature, architecture, and the neighborhood's own history.",
    long: "Stacks reach the ceiling in two narrow rooms. The owner knows which lane each regular lives on and keeps their requests under the counter." },
  { name: "Bancho Stationer", category: "Shopping", tags: "Shopping", neighborhoods: ["Bancho"], slug: "bancho-stationer",
    short: "Notebooks, ink, and seals for the small offices nearby.",
    long: "The shop looks unchanged from its office-supply years, with wooden drawers and a wrapping counter. Walk-in customers are mostly people who work on the same block." },
  { name: "Monzen Market", category: "Shopping", tags: "Shopping", neighborhoods: ["Monzen-nakacho"], slug: "monzen-market",
    short: "A covered stall row for fish, pickles, and everyday groceries.",
    long: "The market sits on the approach to the shrine and serves the apartments around it. By late afternoon the fishmonger is packing ice, not calling to visitors." },
  { name: "Yanaka Gallery Lane", category: "Arts & Culture", tags: "Galleries", neighborhoods: ["Yanaka", "Nezu", "Sendagi"], slug: "yanaka-gallery-lane",
    short: "Three small rooms showing local painters along one lane.",
    long: "Exhibitions change each month and stay up long enough for neighbors to see them twice. The rooms are former houses, with the kitchens still in the back." },
  { name: "Nezu Print Room", category: "Arts & Culture", tags: "Galleries", neighborhoods: ["Nezu"], slug: "nezu-print-room",
    short: "Woodblock prints cut and sold in the same shop.",
    long: "The press is visible from the entrance, and proofs hang on a wire to dry. Visitors can buy a single sheet or watch a demonstration on weekend mornings." },
  { name: "Kagurazaka Atelier", category: "Arts & Culture", tags: "Galleries", neighborhoods: ["Kagurazaka"], slug: "kagurazaka-atelier",
    short: "A shared studio for ceramicists above a quiet side street.",
    long: "The gallery in front shows one maker at a time. Classes are small, and the wheels stop before the restaurants on the slope get loud." },
  { name: "Kiyosumi Warehouse", category: "Arts & Culture", tags: "Galleries", neighborhoods: ["Kiyosumi-Shirakawa"], slug: "kiyosumi-warehouse",
    short: "Contemporary shows in a timber warehouse by the canal.",
    long: "The floor is still the original planking, and the exhibitions use the full height of the storehouse. It is a short walk from the garden and rarely crowded." },
  { name: "Koishikawa Garden Hall", category: "Arts & Culture", tags: "Culture", neighborhoods: ["Koishikawa"], slug: "koishikawa-garden-hall",
    short: "Talks and small concerts in a hall beside the old domain garden.",
    long: "The program is chamber music, lectures, and the occasional tea demonstration. Seats are limited, and the garden gate is the landmark." },
  { name: "Yushima Lecture Room", category: "Arts & Culture", tags: "Culture", neighborhoods: ["Yushima", "Hongo"], slug: "yushima-lecture-room",
    short: "Evening lectures in a room near the old Confucian hall.",
    long: "Historians and neighborhood writers use the space for talks that end in an hour. The doors open onto a slope that is already quiet by the time the lecture starts." },
  { name: "Negishi Reading House", category: "Arts & Culture", tags: "Culture", neighborhoods: ["Negishi"], slug: "negishi-reading-house",
    short: "A reading room in a Meiji house kept for the public.",
    long: "Shelves hold novels and local memoirs, and the desks face the garden. It is a place to sit, not a shop, and the hours follow the daylight." },
  { name: "Fukagawa Photo", category: "Arts & Culture", tags: "Galleries", neighborhoods: ["Monzen-nakacho", "Kiyosumi-Shirakawa"], slug: "fukagawa-photo",
    short: "Photographs of the old warehouse districts, printed upstairs.",
    long: "The gallery shows one photographer for six weeks at a time. Prints are small, the room is a former office, and the canal is in most of the frames." },
  { name: "Kuramae Craft Hall", category: "Arts & Culture", tags: "Craft", neighborhoods: ["Kuramae"], slug: "kuramae-craft-hall",
    short: "A hall where leather, paper, and metal workers show finished pieces.",
    long: "Each month a different workshop takes the front room. Demonstrations are short, and the pieces on the table are the ones made that week." },
  { name: "Shirokane Salon", category: "Arts & Culture", tags: "Culture", neighborhoods: ["Shirokane"], slug: "shirokane-salon",
    short: "A listening room for chamber recordings in a former drawing room.",
    long: "Afternoons are reserved for a single album played through once. The chairs are few, and the house stays as quiet as the street outside." },
  { name: "Sendagi Bath", category: "Wellness", tags: "Baths", neighborhoods: ["Sendagi", "Yanaka"], slug: "sendagi-bath",
    short: "A neighborhood sento with a cedar tub and a small sauna.",
    long: "The bath opens late afternoon and closes before midnight. Regulars bring their own washbowls, and the tile mural above the tub is older than the streetlights." },
  { name: "Kohinata Stretch", category: "Wellness", tags: "Studios", neighborhoods: ["Kohinata", "Kagurazaka"], slug: "kohinata-stretch",
    short: "Slow stretch classes in a room halfway up the hill.",
    long: "Sessions are eight people and an hour long. The studio was a storeroom; mats replace the shelves, and the windows face the slope." },
  { name: "Shirokane Quiet", category: "Wellness", tags: "Studios", neighborhoods: ["Shirokane"], slug: "shirokane-quiet",
    short: "A reservation-only treatment room in a garden house.",
    long: "Appointments are single and unhurried. The waiting room looks onto bamboo, and the street entrance is easy to walk past." },
  { name: "Hongo Clinic Walk", category: "Wellness", tags: "Clinics", neighborhoods: ["Hongo"], slug: "hongo-clinic-walk",
    short: "A small clinic offering walking consultations around the university lanes.",
    long: "The visit starts indoors and continues for twenty quiet minutes outside. It is meant for neighbors, not for a crowd between classes." },
  { name: "Bancho Breath", category: "Wellness", tags: "Studios", neighborhoods: ["Bancho"], slug: "bancho-breath",
    short: "Breathing and posture sessions before the offices open.",
    long: "Morning classes end by eight. The room is a former meeting space, cleared of its table, with the windows cracked onto a leafy block." },
  { name: "Kiyosumi Soak", category: "Wellness", tags: "Baths", neighborhoods: ["Kiyosumi-Shirakawa"], slug: "kiyosumi-soak",
    short: "A private soaking tub rented by the hour in a warehouse annex.",
    long: "One party uses the tub at a time. The water is plain, the room faces the canal, and towels are the only service." },
  { name: "Nezu Morning Yoga", category: "Wellness", tags: "Studios", neighborhoods: ["Nezu", "Sendagi"], slug: "nezu-morning-yoga",
    short: "Sunrise yoga a few minutes from the shrine garden.",
    long: "Classes are small and finish before the cafe counters fill. Mats stay in a cupboard by the door so the room can be a studio or a quiet hall." },
  { name: "Yushima Apothecary", category: "Wellness", tags: "Clinics", neighborhoods: ["Yushima"], slug: "yushima-apothecary",
    short: "Herbal consultations in a shop beneath the shrine slope.",
    long: "Drawers of tea and remedies line the wall, and advice is given at the counter. The pharmacist still lives above the shop." },
  { name: "Monzen Massage", category: "Wellness", tags: "Studios", neighborhoods: ["Monzen-nakacho"], slug: "monzen-massage",
    short: "A two-room massage practice off the shrine approach.",
    long: "Appointments last fifty minutes and the waiting bench is outside. Regulars book on the way home from the market." },
  { name: "Koishikawa Garden Walk", category: "Wellness", tags: "Studios", neighborhoods: ["Koishikawa", "Kohinata"], slug: "koishikawa-garden-walk",
    short: "Guided easy walks that start at the garden gate.",
    long: "The route stays on residential streets and ends within an hour. Groups are capped so the lane never feels like a tour." }
]

more_establishments = [
  { name: "Mejiro Gate Coffee", category: "Cafes", tags: "Cafes", slug: "mejiro-gate-coffee",
    short: "Filter coffee served at a hedge-side counter.",
    long: "Four seats face a garden wall, and the cake is whatever was baked that morning. The shop closes when the school day ends." },
  { name: "Zoshigaya Kettle", category: "Cafes", tags: "Cafes", slug: "zoshigaya-kettle",
    short: "Tea and thick toast in a former classroom annex.",
    long: "The kettle stays on the stove, and the menu is written on a slate. Regulars read while the street outside stays residential." },
  { name: "Mukojima Brew", category: "Cafes", tags: "Cafes", slug: "mukojima-brew",
    short: "A riverside coffee bar with six stools.",
    long: "Cups are poured to order and there is nowhere to linger with a laptop. The door faces the river path, not a shopping street." },
  { name: "Kyojima Cup", category: "Cafes", tags: "Cafes", slug: "kyojima-cup",
    short: "Instant-quiet coffee in a wooden nagaya front room.",
    long: "The counter was once a family shop window. One baker supplies the morning bun, and the room empties by late afternoon." },
  { name: "Kiba Park Coffee", category: "Cafes", tags: "Cafes", slug: "kiba-park-coffee",
    short: "Takeaway coffee at the edge of the old timber park.",
    long: "There are two tables under the eaves and a bench for people walking the park. The beans change monthly and the hours follow daylight." },
  { name: "Denen Roast", category: "Cafes", tags: "Cafes", slug: "denen-roast",
    short: "A single-origin roast bar on a curved garden-suburb street.",
    long: "Roasting happens in the back room twice a week. The front has a window seat and no music." },
  { name: "Gotokuji Milk", category: "Cafes", tags: "Cafes", slug: "gotokuji-milk",
    short: "Milk drinks and a short cake list past the temple gate.",
    long: "The shop is easy to miss once the temple visitors turn back. Seats are low, and the last order is midafternoon." },
  { name: "Ogikubo Filter", category: "Cafes", tags: "Cafes", slug: "ogikubo-filter",
    short: "Hand-filtered coffee beside a row of antique shops.",
    long: "The owner brews one cup at a time and keeps the door shut. A shelf of used design books is the only decoration." },
  { name: "Takanawa Espresso", category: "Cafes", tags: "Cafes", slug: "takanawa-espresso",
    short: "Espresso on the temple hill above the station.",
    long: "The bar is a former gate office with three stools. Commuters rarely find it; the regulars live on the hill." },
  { name: "Juban Corner Coffee", category: "Cafes", tags: "Cafes", slug: "juban-corner-coffee",
    short: "Neighborhood coffee just off the old market street.",
    long: "The corner is quieter than the shopping street it faces. Pour-over, hojicha, and one sandwich are the whole menu." },
  { name: "Mejiro Teishoku", category: "Food & Drink", tags: "Restaurants", slug: "mejiro-teishoku",
    short: "A daily set meal for the houses behind the station.",
    long: "The board lists one fish and one vegetable plate. Lunch ends when the rice cooker is empty." },
  { name: "Kishimojin Diner", category: "Food & Drink", tags: "Restaurants", slug: "kishimojin-diner",
    short: "Home cooking a short walk from the temple.",
    long: "Eight counter seats and a noren are the whole front. The cook serves soup, rice, and whatever was good at the morning market." },
  { name: "Sumida Grill", category: "Food & Drink", tags: "Restaurants", slug: "sumida-grill",
    short: "Charcoal-grilled fish in a room that faces the river.",
    long: "Dinner is one seating and a short menu. The windows stay open when the weather allows, and the street is residential." },
  { name: "Nagaya Kitchen", category: "Food & Drink", tags: "Restaurants", slug: "nagaya-kitchen",
    short: "A family kitchen serving rice bowls from a wooden storefront.",
    long: "There is no reservation book. Neighbors eat early, and the lights go off before the main road gets busy." },
  { name: "Kiba Soba", category: "Food & Drink", tags: "Restaurants", slug: "kiba-soba",
    short: "Buckwheat noodles in a room that once stored timber tools.",
    long: "The noodles are cut in the morning and served cold or hot. A flask of sake is the only thing added at night." },
  { name: "Garden Suburb Table", category: "Food & Drink", tags: "Restaurants", slug: "garden-suburb-table",
    short: "A small dining room on a quiet planned street.",
    long: "The menu is four plates and changes with the week. Guests book ahead because the table seats twelve." },
  { name: "Temple Gate Lunch", category: "Food & Drink", tags: "Restaurants", slug: "temple-gate-lunch",
    short: "Set lunches for people who live past the temple gate.",
    long: "The shop does not face the approach. Regulars come from the houses behind it, and the kitchen stops after two o'clock." },
  { name: "Antique Lane Supper", category: "Food & Drink", tags: "Restaurants", slug: "antique-lane-supper",
    short: "A six-seat supper after the antique shops close.",
    long: "One menu is served each night, and the door is locked between seatings. The lane outside is already dark when dinner starts." },
  { name: "Tokaido Fish", category: "Food & Drink", tags: "Restaurants", slug: "tokaido-fish",
    short: "A fish counter on the old hill road.",
    long: "The catch is written on paper and grilled simply. Seats turn over once, then the counter is wiped down." },
  { name: "Azabu Home Plate", category: "Food & Drink", tags: "Restaurants", slug: "azabu-home-plate",
    short: "A residential dining room off the market street.",
    long: "Lunch is a single plate. In the evening the same kitchen serves a longer menu to the apartments on the block." },
  { name: "Mejiro Paper", category: "Shopping", tags: "Shopping", slug: "mejiro-paper",
    short: "Notebooks and letterpress cards in a narrow shop.",
    long: "Drawers of paper line one wall, and the press sits in the back. The owner wraps each purchase in plain brown paper." },
  { name: "Zoshigaya General", category: "Shopping", tags: "Shopping", slug: "zoshigaya-general",
    short: "Soap, brushes, and pantry goods for the surrounding houses.",
    long: "The stock is ordinary on purpose. Neighbors still send children in for the things forgotten at the supermarket." },
  { name: "Mukojima Cloth", category: "Shopping", tags: "Shopping", slug: "mukojima-cloth",
    short: "Indigo lengths and mended everyday clothes.",
    long: "Bolts are stacked to the ceiling in a room barely wider than the door. Repairs are taken in the morning and returned within the week." },
  { name: "Kyojima Tools", category: "Shopping", tags: "Shopping", slug: "kyojima-tools",
    short: "Hand tools and household hardware in a nagaya shop.",
    long: "The drawers are labeled in pencil and the prices are modest. Tradespeople from the block buy here before the larger stores open." },
  { name: "Kiba Timber Goods", category: "Shopping", tags: "Shopping", slug: "kiba-timber-goods",
    short: "Small wooden household pieces from a former lumber office.",
    long: "Boards, trays, and stools are the whole selection. The maker works in the room behind the display." },
  { name: "Denen Florist", category: "Shopping", tags: "Shopping", slug: "denen-florist",
    short: "Cut flowers wrapped for the houses on the curved streets.",
    long: "Bunches are small and rarely include a card. A bucket of branches sits by the door for people walking home." },
  { name: "Gotokuji Charms", category: "Shopping", tags: "Shopping", slug: "gotokuji-charms",
    short: "Paper charms and small gifts a lane away from the temple.",
    long: "The shop is not on the temple approach, so the crowd thins before it. Shelves hold charms, incense, and handmade cards." },
  { name: "Ogikubo Antiques", category: "Shopping", tags: "Shopping", slug: "ogikubo-antiques",
    short: "Dishes, lamps, and old tools on a short antique street.",
    long: "Prices are marked on paper tags, and the owner will tell you where each piece came from. The shutters close before dinner." },
  { name: "Takanawa Ceramics", category: "Shopping", tags: "Shopping", slug: "takanawa-ceramics",
    short: "Everyday bowls fired by a potter on the hill.",
    long: "The display is one table of cups and plates. Special orders are written in a notebook and collected the following month." },
  { name: "Juban Basket", category: "Shopping", tags: "Shopping", slug: "juban-basket",
    short: "Baskets, linens, and kitchen cloth from a side-street shop.",
    long: "The stock is meant for the apartments behind the market, not for souvenirs. A few pieces are made in the workshop upstairs." },
  { name: "Mejiro Listening Room", category: "Arts & Culture", tags: "Culture", slug: "mejiro-listening-room",
    short: "Afternoon listening sessions in a former drawing room.",
    long: "One album is played through, then the room is quiet again. Chairs are few and the street door is unmarked." },
  { name: "Zoshigaya Print", category: "Arts & Culture", tags: "Galleries", slug: "zoshigaya-print",
    short: "Woodblock prints cut and sold in the same small room.",
    long: "Proofs dry on a wire above the press. Weekend mornings include a short demonstration if the printer is in." },
  { name: "Mukojima Gallery", category: "Arts & Culture", tags: "Galleries", slug: "mukojima-gallery",
    short: "A one-room gallery in a house facing the river.",
    long: "Exhibitions last six weeks and favor local painters. The kitchen is still in the back, and openings are deliberately small." },
  { name: "Kyojima Photo", category: "Arts & Culture", tags: "Galleries", slug: "kyojima-photo",
    short: "Photographs of the wooden quarter, printed upstairs.",
    long: "The show changes slowly, and the prints are small enough to carry home. The stair is steep and the room holds ten people at most." },
  { name: "Kiba Warehouse Show", category: "Arts & Culture", tags: "Galleries", slug: "kiba-warehouse-show",
    short: "Installations in a shed that once held lumber samples.",
    long: "Artists use the height of the shed and little else. The door is open on weekends and locked on weekday mornings." },
  { name: "Denen Garden Talks", category: "Arts & Culture", tags: "Culture", slug: "denen-garden-talks",
    short: "Short evening talks in a hall on the garden suburb.",
    long: "Speakers are neighborhood writers and historians, and each talk ends in an hour. Tea is poured afterward for whoever stays." },
  { name: "Gotokuji Atelier", category: "Arts & Culture", tags: "Galleries", slug: "gotokuji-atelier",
    short: "A shared ceramics studio with a tiny front gallery.",
    long: "One maker shows at a time, and the wheels stop before evening. Classes are capped at six." },
  { name: "Ogikubo Reading Room", category: "Arts & Culture", tags: "Culture", slug: "ogikubo-reading-room",
    short: "A public reading room of novels and local memoirs.",
    long: "Desks face the window onto the antique street. It is not a shop, and the hours follow the daylight." },
  { name: "Takanawa Temple Hall", category: "Arts & Culture", tags: "Culture", slug: "takanawa-temple-hall",
    short: "Chamber music in a hall beside the temple precinct.",
    long: "Concerts are small and acoustic. The audience walks up the hill, and the program ends early enough for the last train to be irrelevant." },
  { name: "Azabu Salon", category: "Arts & Culture", tags: "Culture", slug: "azabu-salon",
    short: "A salon for talks and small recitals off the market.",
    long: "The room was a meeting space and still has its original doors. Events are announced on a card in the window, not online." },
  { name: "Mejiro Stretch", category: "Wellness", tags: "Studios", slug: "mejiro-stretch",
    short: "Slow stretch classes in a cleared storeroom.",
    long: "Sessions last an hour and take eight people. Mats replace the old shelves, and the windows face a hedge." },
  { name: "Zoshigaya Bath", category: "Wellness", tags: "Baths", slug: "zoshigaya-bath",
    short: "A neighborhood sento with a cedar tub.",
    long: "The bath opens in the late afternoon. Regulars bring their own bowls, and the mural over the tub has not been repainted in decades." },
  { name: "Mukojima Walk", category: "Wellness", tags: "Studios", slug: "mukojima-walk",
    short: "Easy guided walks that stay on the river streets.",
    long: "Groups are small and the route is an hour. The meeting point is a bridge, and the pace suits the people who live nearby." },
  { name: "Kyojima Soak", category: "Wellness", tags: "Baths", slug: "kyojima-soak",
    short: "A private tub rented by the hour in a back house.",
    long: "One party uses the room at a time. Towels are provided, and the entrance is a sliding door off the lane." },
  { name: "Kiba Quiet Room", category: "Wellness", tags: "Studios", slug: "kiba-quiet-room",
    short: "A reservation-only rest room beside the park.",
    long: "Appointments are single and silent. The window looks onto trees that were planted where the timber ponds used to be." },
  { name: "Denen Morning Yoga", category: "Wellness", tags: "Studios", slug: "denen-morning-yoga",
    short: "Sunrise yoga on a quiet planned street.",
    long: "Classes finish before the cafe counters fill. The room is a former garage, with the door open when the weather is fair." },
  { name: "Gotokuji Breath", category: "Wellness", tags: "Studios", slug: "gotokuji-breath",
    short: "Breathing sessions a few minutes from the temple.",
    long: "Morning groups end by eight. The studio is upstairs, and shoes stay on a rack at the bottom of the stair." },
  { name: "Ogikubo Clinic", category: "Wellness", tags: "Clinics", slug: "ogikubo-clinic",
    short: "A small clinic for the people who live above the shops.",
    long: "Consultations are unhurried and the waiting room holds six. The doctor still lives on the block." },
  { name: "Takanawa Massage", category: "Wellness", tags: "Studios", slug: "takanawa-massage",
    short: "A two-room massage practice on the temple hill.",
    long: "Appointments last fifty minutes. The waiting bench is outside, under the eaves." },
  { name: "Juban Apothecary", category: "Wellness", tags: "Clinics", slug: "juban-apothecary",
    short: "Herbal teas and simple remedies off the market street.",
    long: "Advice is given at the counter, and the drawers are labeled by hand. The pharmacist lives above the shop." }
]

neighborhood_pool = Neighborhood.order(:name).pluck(:name)
rng = Random.new(50)
more_establishments.each do |attrs|
  count = rng.rand(1..2)
  picked = []
  while picked.size < count
    name = neighborhood_pool.fetch(rng.rand(neighborhood_pool.size))
    picked << name unless picked.include?(name)
  end
  attrs[:neighborhoods] = picked
end

(establishments + more_establishments).each do |attrs|
  category = EstablishmentCategory.find_by!(name: attrs[:category])
  neighborhoods = Neighborhood.where(name: attrs[:neighborhoods]).to_a
  if neighborhoods.size != attrs[:neighborhoods].size
    missing = attrs[:neighborhoods] - neighborhoods.map(&:name)
    raise "Missing neighborhoods for #{attrs[:name]}: #{missing.join(", ")}"
  end

  area = attrs[:neighborhoods].first
  establishment = Establishment.find_or_initialize_by(name: attrs[:name])
  establishment.update!(
    short: attrs[:short],
    long: attrs[:long],
    tags: attrs[:tags],
    maps: "https://www.google.com/maps/search/?api=1&query=#{URI.encode_www_form_component("#{attrs[:name]} #{area} Tokyo")}",
    cover_image: "https://picsum.photos/seed/#{attrs[:slug]}/1200/800",
    establishment_category: category
  )
  establishment.neighborhoods = neighborhoods
end

guest = Guest.find_or_initialize_by(keycard_token: "SL-GUEST-001")
guest.update!(check_in_status: true)

user = User.find_or_initialize_by(email: "admin@g.com")
user.update!(password: "asdf1234", admin: true)
