const std = @import("std");
const Io = std.Io;
const Duration = Io.Duration;
const sleep = Io.sleep;

pub fn basic(io: Io) void {
    const hour: Duration = .fromSeconds(3600);
    var task = io.async(sleep, .{ io, hour, Io.Clock.awake });
    task.cancel(io) catch |err| switch (err) {
        error.Canceled => std.debug.print("canceled\n", .{}),
    };
}
