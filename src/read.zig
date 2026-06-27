const std = @import("std");
const Io = std.Io;

pub fn fixed() !void {
    const quote =
        \\The moment you doubt whether you can fly,
        \\you cease forever to be able to do it.
    ;
    var reader = Io.Reader.fixed(quote);
    while (true) {
        const line = try reader.takeDelimiter('\n') orelse break;
        std.debug.print("{s}\n", .{line});
    }
}
