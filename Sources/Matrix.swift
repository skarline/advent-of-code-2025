struct Matrix<Element> {
  let rows: Int, columns: Int
  private var grid: [Element]

  var indices: [(Int, Int)] {
    (0..<rows).flatMap { row in (0..<columns).map { column in (row, column) } }
  }

  init(repeating: Element, rows: Int, columns: Int) {
    self.rows = rows
    self.columns = columns
    grid = Array(repeating: repeating, count: rows * columns)
  }

  init(twoDimensionalArray: [[Element]]) {
    rows = twoDimensionalArray.count
    columns = twoDimensionalArray.first?.count ?? 0
    grid = twoDimensionalArray.flatMap { $0 }
  }

  func indexIsValid(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
  }

  func get(row: Int, column: Int) -> Element? {
    guard indexIsValid(row: row, column: column) else { return nil }
    return self[row, column]
  }

  subscript(row: Int, column: Int) -> Element {
    get {
      precondition(indexIsValid(row: row, column: column), "Index out of range")
      return grid[(row * columns) + column]
    }
    set {
      precondition(indexIsValid(row: row, column: column), "Index out of range")
      grid[(row * columns) + column] = newValue
    }
  }
}
