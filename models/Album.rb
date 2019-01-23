require_relative("../db/sql_runner")

class Album

  attr_reader :name, :genre, :release_year, :artist_id, :id
  attr_accessor :name

  def initialize(options)
    @name = options["name"]
    @genre = options["genre"]
    @release_year = options["release_year"].to_i
    @artist_id = options["artist_id"].to_i
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO albums (name, genre, release_year, artist_id)
           VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @genre, @release_year, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"]
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.find_by_artist(id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [id]
    albums = SqlRunner.run(sql, values)
    return albums.map { |album| Album.new(album) }
  end

  def update()
    sql = "UPDATE albums
           SET (name, genre, release_year, artist_id) = ($1, $2, $3, $4)
           WHERE id = $5"
    values = [@name, @genre, @release_year, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values).first
    return Album.new(album)
  end



end
