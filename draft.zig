const std = @import("std");

pub fn main() !void {
    var x: u8 = undefined;
    var k: bool = (x == undefined);
    std.debug.print("x is undefined: {}\n", .{k});
    x = 1;
    k = false;
}
