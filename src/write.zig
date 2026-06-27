const std = @import("std");
const Io = std.Io;

pub fn fixed() !void {
    var buffer: [40]u8 = undefined;
    var writer = Io.Writer.fixed(&buffer);
    const message = "foobar";
    std.debug.print("bytes written: {d}/{d}\n", .{
        try writer.write(message),
        message.len,
    });
}
