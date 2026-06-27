const std = @import("std");
const Io = std.Io;

const ziguana = @import("ziguana");

const Example = enum {
    async,
    cancel,
    dice,
    enums,
    stdio,
};

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var args = try init.minimal.args.toSlice(init.arena.allocator());
    for (args[1..], 0..) |arg, i| {
        if (i > 0) {
            std.debug.print("\n", .{});
        }
        const example = std.meta.stringToEnum(Example, arg) orelse {
            return error.InvalidExampleChoice;
        };
        switch (example) {
            .async => ziguana.async.sums(io),
            .cancel => ziguana.cancel.sleep(io),
            .dice => ziguana.diceRoll(io),
            .enums => ziguana.enums.enumerate(),
            .stdio => try ziguana.stdio.sayThatName(io),
        }
    }
}
