const std = @import("std");
const Io = std.Io;
const T = i64;
const Queue = std.Io.Queue(T);

pub fn basic(io: Io) !void {
    var buf: [3]T = undefined;
    var que = Queue.init(&buf);
    var group = std.Io.Group.init;
    group.async(io, pow, .{ io, &que, 2, 2 });
    group.async(io, pow, .{ io, &que, 2, 3 });
    group.async(io, pow, .{ io, &que, 2, 4 });
    try group.await(io);
    que.close(io);
    while (true) {
        std.debug.print("result: {d}\n", .{
            que.getOneUncancelable(io) catch break,
        });
    }
}

fn pow(io: Io, que: *Queue, x: T, y: T) Io.Cancelable!void {
    que.putOneUncancelable(io, std.math.pow(T, x, y)) catch return;
}
