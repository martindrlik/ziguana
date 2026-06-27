const std = @import("std");
const Io = std.Io;

const ziguana = @import("ziguana");

const Example = enum {
    async,
    cancel,
    dice,
};

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var args = try init.minimal.args.toSlice(init.arena.allocator());
    for (args[1..]) |arg| {
        const example = std.meta.stringToEnum(Example, arg) orelse {
            return error.InvalidExampleChoice;
        };
        switch (example) {
            .async => ziguana.async.sums(io),
            .cancel => ziguana.cancel.sleep(io),
            .dice => ziguana.diceRoll(io),
        }
        std.debug.print("--\n", .{});
    }
}
