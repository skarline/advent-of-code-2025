struct Day05: AdventDay {
  var data: String

  func parse() -> ([ClosedRange<Int>], [Int]) {
    let parts = data.split(separator: "\n\n")
    guard parts.count == 2 else { fatalError("Invalid input") }

    let ranges = parts[0]
      .components(separatedBy: .newlines)
      .compactMap { line -> ClosedRange<Int>? in
        let ids = line.split(separator: "-").compactMap { Int($0) }
        guard ids.count == 2 else { return nil }
        return ids[0]...ids[1]
      }

    let ids = parts[1]
      .components(separatedBy: .newlines)
      .compactMap { Int($0) }

    return (ranges, ids)
  }

  func part1() -> Int {
    let (ranges, ids) = parse()
    var count = 0

    for id in ids
    where ranges.contains(where: { $0.contains(id) }) {
      count += 1
    }

    return count
  }

  func part2() -> Int {
    var (ranges, _) = parse()
    ranges.sort { $0.lowerBound < $1.lowerBound }

    var count = 0
    var maxId = 0

    for range in ranges where range.upperBound > maxId {
      maxId = range.upperBound
      count += max(maxId + 1, range.lowerBound).distance(to: maxId) + 1
    }

    return count
  }
}
