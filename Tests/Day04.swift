import Testing

@testable import AdventOfCode

struct Day04Tests {
  let example = """
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
    """

  @Test func testPart1() async throws {
    #expect(Day04(data: example).part1() == 13)
  }

  @Test func testPart2() async throws {
    #expect(Day04(data: example).part2() == 43)
  }
}
