import Testing

@testable import AdventOfCode

struct Day03Tests {
  let example = """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """

  @Test func testPart1() async throws {
    #expect(Day03(data: example).part1() == 357)
  }

  @Test func testPart2() async throws {
    #expect(Day03(data: example).part2() == 3_121_910_778_619)
  }
}
