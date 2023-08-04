const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn();
    var buf = std.io.bufferedReader(in.reader());

    var r = buf.reader();

    std.debug.print("Enter something: ", .{});

    var msg_buf: [4096]u8 = undefined;

    var msg = try r.readUntilDelimiterOrEof(&msg_buf, '\n');

    if (msg) |m| {
        std.debug.print("You entered: {s}\n", .{m});
    }
}
