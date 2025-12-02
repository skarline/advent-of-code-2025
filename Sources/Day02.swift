import Foundation

struct Day02: AdventDay {
  var data: String

  var ranges: [ClosedRange<Int>] {
    data.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ",").compactMap {
      string in
      let ids = string.split(separator: "-").compactMap { Int(String($0)) }
      guard ids.count == 2 else { return nil }
      return ids[0]...ids[1]
    }
  }

  func countDigits(_ number: Int) -> Int {
    if number == 0 { return 1 }
    return Int(log10(Double(number.magnitude))) + 1
  }

  func hasRepeatingHalves(_ number: Int) -> Bool {
    guard number >= 10 else { return false }

    let digitCount = countDigits(number)
    let mask = Int(pow(10, Double(digitCount) / 2)) + 1

    return number.isMultiple(of: mask)
  }

  func hasRepeatingSequence(_ number: Int) -> Bool {
    guard number >= 10 else { return false }

    let digitCount = countDigits(number)

    for length in 1...(digitCount / 2) where digitCount.isMultiple(of: length) {
      let shift = Int(pow(10, Double(length)))
      var mask = 1
      for _ in 1..<digitCount / length {
        mask = (mask * shift) + 1
      }

      if number.isMultiple(of: mask) { return true }
    }

    return false
  }

  func part1() -> Int {
    var total = 0

    for range in ranges {
      for id in range where hasRepeatingHalves(id) {
        total += id
      }
    }

    return total
  }

  func part2() -> Int {
    var total = 0

    for range in ranges {
      for id in range where hasRepeatingSequence(id) {
        total += id
      }
    }

    return total
  }
}
