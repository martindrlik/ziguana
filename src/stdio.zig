const std = @import("std");
const builtin = @import("builtin");
const Io = std.Io;

pub fn sayThatName(io: Io) !void {
    var buf: [40]u8 = undefined;
    var stdin = Io.File.stdin().reader(io, &buf);
    var stdout = Io.File.stdout().writer(io, &.{});

    while (true) {
        try stdout.interface.print("Please enter a name: ", .{});
        var name = try stdin.interface.takeDelimiter('\n') orelse break;
        if (builtin.os.tag == .windows) {
            name = @constCast(std.mem.trimEnd(u8, name, '\r'));
        }
        if (name.len == 0) {
            break;
        }
        try stdout.interface.print("Hello {s}!\n", .{name});
    }
}
