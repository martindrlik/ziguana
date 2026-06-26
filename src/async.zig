const std = @import("std");
const Io = std.Io;

pub fn sums(io: Io) void {
    var task1 = io.async(sum, .{ 1, 500 });
    defer _ = task1.cancel(io);

    var task2 = io.async(sum, .{ 501, 1_000 });
    defer _ = task2.cancel(io);

    std.debug.print("other work...\n", .{});

    const sum1 = task1.await(io);
    const sum2 = task2.await(io);

    std.debug.print("Total sum = {}\n", .{sum1 + sum2});
}

fn sum(start: usize, end: usize) usize {
    var n: usize = 0;
    for (start..end + 1) |i| {
        n += i;
    }
    std.debug.print("sum({}..{}) finished\n", .{ start, end });
    return n;
}
