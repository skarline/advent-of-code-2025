struct Day04: AdventDay {
  var data: String

  enum Element: Character {
    case empty = "."
    case roll = "@"
  }

  func rollIsAccessible(matrix: Matrix<Element>, row: Int, column: Int) -> Bool {
    guard matrix[row, column] == .roll else { return false }

    let deltas = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    var adjacentRollCount = 0

    for delta in deltas {
      let adjacentColumn = column + delta.0
      let adjacentRow = row + delta.1

      if matrix.get(row: adjacentRow, column: adjacentColumn) == .roll {
        if adjacentRollCount == 3 { return false }
        adjacentRollCount += 1
      }
    }

    return true
  }

  func parse() -> Matrix<Element> {
    let data = data.trimmingCharacters(in: .whitespacesAndNewlines)
      .components(separatedBy: .newlines)
      .map { $0.compactMap { Element(rawValue: $0) } }

    return Matrix(twoDimensionalArray: data)
  }

  func part1() -> Int {
    let matrix = parse()
    var count = 0

    for (row, column) in matrix.indices
    where rollIsAccessible(matrix: matrix, row: row, column: column) {
      count += 1
    }

    return count
  }

  func part2() -> Int {
    var matrix = parse()
    var total = 0

    while true {
      var removed = 0

      for (row, column) in matrix.indices
      where rollIsAccessible(matrix: matrix, row: row, column: column) {
        matrix[row, column] = .empty
        removed += 1
      }

      if removed == 0 { return total }
      total += removed
    }
  }
}
