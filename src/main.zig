const std = @import("std");
const Io = std.Io;

const ziguana = @import("ziguana");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    std.debug.print("async:\n", .{});
    ziguana.async.sums(io);

    std.debug.print("\nrandom:\n", .{});
    std.debug.print("dice roll {d}\n", .{ziguana.dice.roll(io)});
}
