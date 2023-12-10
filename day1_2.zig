const std = @import("std");
const expect = std.testing.expect;

fn getDigitFromStr(str: []const u8) !u8 {
    if (str.len == 0) {
        return 0;
    }

    return switch (str) {
        "zero" => 0,
        "one" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9,
        else => return error.Unreachable,
    };
}

test "test getDigitFromStr" {
    try expect(getDigitFromStr("zero") == 0);
}
