const std = @import("std");
const ascii = std.ascii;

pub fn main() !void {
    var fileHandle = try std.fs.cwd().openFile("./data-set/day1", .{});
    defer fileHandle.close();

    var buf: [100]u8 = undefined;
    var final: u32 = 0;
    while (try fileHandle.reader().readUntilDelimiterOrEof(&buf, '\n')) |line| {
        if (line.len == 0) {
            continue;
        }

        // Only one element.
        var forer: usize = 0;
        var backer: usize = line.len - 1;
        if (forer == backer and !ascii.isDigit(line[forer])) {
            continue;
        }

        // Two pointers running towards each other.
        // std.debug.print("line: {s}\n", .{line});
        var metFirst: bool = false;
        var metSecond: bool = false;
        while (forer <= backer) {
            if (!metFirst and ascii.isDigit(line[forer])) {
                final += @as(u32, (line[forer] - '0') * 10);
                metFirst = true;
            }
            if (!metSecond and ascii.isDigit(line[backer])) {
                final += @as(u32, line[backer] - '0');
                metSecond = true;
            }

            if (!metFirst) {
                forer += 1;
            } else if (!metSecond) {
                backer -= 1;
            } else {
                break;
            }
        }
    }

    std.debug.print("final: {d}\n", .{final});
}

// result: 54697
