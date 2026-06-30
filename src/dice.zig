const std = @import("std");
const Io = std.Io;

pub fn roll(io: Io) void {
    const rng_impl: std.Random.IoSource = .{ .io = io };
    const secureRand = rng_impl.interface();
    std.debug.print("result: {d}\n", .{secureRand.intRangeAtMost(u8, 1, 6)});
}
