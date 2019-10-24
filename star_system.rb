class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    name_planets = []
    for planet in @planets
      name_planets.push(planet.name)
      # planet.each { |planet_hash| name_planets << planet_hash.name }
    end
    return name_planets
  end

  def get_planet_by_name(name)
    for planet in @planets
      if planet.name == name
        return planet
      end
    end
  end

  def get_largest_planet
    @planets.max_by { |planet| planet.diameter}
    # for planet in @planets
    #   planet.diameter
    # end
    # diameter = []
    # for planet in @planets
    #   diameter.push(planet.diameter)
    # end
    # max = diameter.max
  end

  def get_smallest_planet
    @planets.min_by { |planet| planet.diameter}
  end

  def get_planets_with_no_moons
    @planets.find_all { |planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(num)
    planet_array = []
    for planet in @planets
      if planet.number_of_moons > num
        planet_array.push(planet.name)
      end
    end
    return planet_array
  end


    def get_number_of_planets_closer_than(num)
      x = @planets.find_all { |planet| planet.distance_from_sun < num }
      return x.count
    end

    def get_total_number_of_moons
      num_of_moons = []
      @planets.each { |planet| num_of_moons.push(planet.number_of_moons) }
      return num_of_moons.reduce() {|sum, number| sum + number }
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
      array_1 = @planets.sort_by { |planet| planet.distance_from_sun }
      sorted_array = []
      array_1.each { |planet| sorted_array << planet.name}
      return sorted_array
    end

    def get_planet_names_sorted_by_size_decreasing
      array_1 = @planets.sort_by { |planet| planet.diameter }
      sorted_array = []
      array_1.each { |planet| sorted_array << planet.name}
      return sorted_array.reverse
    end






end
