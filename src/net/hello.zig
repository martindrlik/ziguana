const std = @import("std");
const Io = std.Io;
const HostName = Io.net.HostName;

pub fn basic(io: Io) !void {
    var stream = try HostName.connect(
        try .init("example.com"),
        io,
        443,
        .{
            .mode = .stream,
            .protocol = .tcp,
        },
    );
    var buffer: [16000]u8 = undefined;
    var writer = stream.writer(io, &buffer);
    try writer.interface.writeAll("GET /\r\n\r\n");
    try writer.interface.flush();

    var reader = stream.reader(io, &buffer);
    while (true) {
        const text = try reader.interface.takeDelimiter('>') orelse break;
        std.debug.print("{s}>", .{text});
    }
}
