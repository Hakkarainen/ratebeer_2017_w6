b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

Beer.create name:"Iso 3", brewery_id:1, style_id:1
Beer.create name:"Karhu", brewery_id:1, style_id:1
Beer.create name:"Tuplahumala", brewery_id:1, style_id:1
Beer.create name:"Huvila Pale Ale", brewery_id:2, style_id:2
Beer.create name:"X Porter", brewery_id:2, style_id:3
Beer.create name:"Hefeweizen", brewery_id:3, style_id:3
Beer.create name:"Helles", brewery_id:3, style_id:1

Style.create name:"Lager"
Style.create name:"Lager"
Style.create name:"Dark"
Style.create name:"Pale Ale"
Style.create name:"Porter"
Style.create name:"Mild"
Style.create name:"Strong"