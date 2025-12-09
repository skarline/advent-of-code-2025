import Testing

@testable import AdventOfCode

struct Day05Tests {
  let example = """
    3-5
    10-14
    16-20
    12-18

    1
    5
    8
    11
    17
    32
    """

  @Test func testPart1() async throws {
    #expect(Day05(data: example).part1() == 3)
  }

  @Test func testPart2() async throws {
    #expect(Day05(data: example).part2() == 14)
  }
}
