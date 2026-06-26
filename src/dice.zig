const std = @import("std");
const Io = std.Io;

pub fn roll(io: Io) u8 {
    const rng_impl: std.Random.IoSource = .{ .io = io };
    const secureRand = rng_impl.interface();
    return secureRand.intRangeAtMost(u8, 1, 6);
}
