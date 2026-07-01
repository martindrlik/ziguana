const std = @import("std");
const Io = std.Io;

const ziguana = @import("ziguana");

const Example = enum {
    arrayList,
    async,
    cancel,
    dice,
    enums,
    interface,
    netHello,
    queue,
    read,
    stdio,
    write,
};

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var args = try init.minimal.args.toSlice(init.arena.allocator());
    for (args[1..], 0..) |arg, i| {
        if (i > 0) {
            std.debug.print("\n", .{});
        }
        switch (std.meta.stringToEnum(Example, arg) orelse return error.UnknownExample) {
            .arrayList => try ziguana.arrayList.basic(init.gpa),
            .async => ziguana.async.basic(io),
            .cancel => ziguana.cancel.basic(io),
            .dice => ziguana.dice.basic(io),
            .enums => ziguana.enums.basic(),
            .interface => ziguana.interface.basic(),
            .netHello => try ziguana.netHello.basic(io),
            .queue => try ziguana.queue.basic(io),
            .read => try ziguana.read.basic(),
            .stdio => try ziguana.stdio.basic(io),
            .write => try ziguana.write.basic(),
        }
    }
}
