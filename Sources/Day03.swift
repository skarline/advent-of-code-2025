import Foundation

struct Day03: AdventDay {
  var data: String

  var banks: [[Int]] {
    data.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines).map {
      $0.compactMap { $0.wholeNumberValue }
    }
  }

  func findBestJoltage(bank: [Int], batteryCount: Int) -> Int {
    var result: [Int] = []
    var leftIndex = 0

    for i in 0..<batteryCount {
      let rightIndex = bank.count + i - batteryCount

      var best: (index: Int, value: Int) = (-1, -1)

      for index in leftIndex...rightIndex {
        let value = bank[index]
        if value > best.value { best = (index, value) }
      }

      result.append(best.value)
      leftIndex = best.index + 1
    }

    return result.reduce(0) { $0 * 10 + $1 }
  }

  func part1() -> Int {
    var total = 0

    for bank in banks {
      total += findBestJoltage(bank: bank, batteryCount: 2)
    }

    return total
  }

  func part2() -> Int {
    var total = 0

    for bank in banks {
      total += findBestJoltage(bank: bank, batteryCount: 12)
    }

    return total
  }
}
