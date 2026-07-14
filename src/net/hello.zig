const std = @import("std");
const Io = std.Io;
const HostName = Io.net.HostName;

pub fn basic(init: std.process.Init) !void {
    var client: std.http.Client = .{ .allocator = init.gpa, .io = init.io };
    defer client.deinit();

    const uri = try std.Uri.parse("https://mnaugirl.netlify.app");

    var req = try client.request(.GET, uri, .{});
    defer req.deinit();

    try req.sendBodiless();

    var buf: [16000]u8 = undefined;
    var res = try req.receiveHead(&buf);

    var iter = res.head.iterateHeaders();
    while (iter.next()) |header| {
        std.debug.print("{s}: {s}\n", .{ header.name, header.value });
    }

    std.debug.print("status: {}\n", .{res.head.status});

    const body = try res.reader(&.{}).allocRemaining(init.gpa, .unlimited);
    defer init.gpa.free(body);

    std.debug.print("body:\n{s}\n", .{body});
}
