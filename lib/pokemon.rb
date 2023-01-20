class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
    end

    def self.find(id, db)
        match = db.execute("SELECT * FROM pokemon WHERE id=?;", id).flatten
        Pokemon.new(id: match[0], name: match[1], type: match[2], db:db)
    end

end
