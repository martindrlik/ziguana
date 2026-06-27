const std = @import("std");
const Io = std.Io;

pub fn sleep(io: Io) void {
    var task = io.async(
        Io.sleep,
        .{
            io,
            durationFromHours(8),
            Io.Clock.awake,
        },
    );
    task.cancel(io) catch |err| switch (err) {
        error.Canceled => std.debug.print("canceled\n", .{}),
    };
}

pub fn durationFromHours(x: i64) Io.Duration {
    const secondsPerHour = 3600;
    return .fromSeconds(x * secondsPerHour);
}
