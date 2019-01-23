require("pry")
require_relative("models/Album")
require_relative("models/Artist")

artist1 = Artist.new({
  "name" => "Eminem",
  "age" => "46"
  })

artist1.save()

artist2 = Artist.new({
  "name" => "Ed Sheeran",
  "age" => "27"
  });

artist2.save()


album1 = Album.new({
  "name" => "Infinite",
  "genre" => "Rap",
  "release_year" => "1996",
  "artist_id" => artist1.id
  });

album1.save()

album2 = Album.new({
  "name" => "The Slim Shady LP",
  "genre" => "Rap",
  "release_year" => "1999",
  "artist_id" => artist1.id
  });

album2.save()

album3 = Album.new({
  "name" => "Divide",
  "genre" => "Pop",
  "release_year" => "2017",
  "artist_id" => artist2.id
  });

album3.save()

# artist1.name = "Marshall Mathers"
# artist1.update() #-- Working
# album2.name = "Encore"
# album2.update()  #-- Working
# artist2.delete() #-- Working
# album1.delete() #-- Working
# Album.delete_all() #-- Working
# Artist.delete_all() #-- Working


binding.pry
nil
