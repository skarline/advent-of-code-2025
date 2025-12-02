struct Day01: AdventDay {
  var data: String

  enum Direction: String {
    case left = "L"
    case right = "R"

    var delta: Int { self == .left ? -1 : 1 }
  }

  typealias Rotation = (Direction, Int)

  var rotations: [Rotation] {
    data.components(separatedBy: .newlines).compactMap { line in
      let regex = /(L|R)(\d+)/
      guard let match = line.firstMatch(of: regex) else { return nil }

      let direction = Direction(rawValue: String(match.1))!
      let distance = Int(match.2)!

      return (direction, distance)
    }
  }

  func part1() -> Int {
    var dial = 50
    var hits = 0

    for (direction, distance) in rotations {
      dial = (dial + direction.delta * distance) % 100
      if dial == 0 { hits += 1 }
    }

    return hits
  }

  func part2() -> Int {
    var dial = 50
    var hits = 0

    for (direction, distance) in rotations {
      for _ in 0..<distance {
        dial = (dial + direction.delta) % 100
        if dial == 0 { hits += 1 }
      }
    }

    return hits
  }
}
