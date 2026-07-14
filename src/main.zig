const std = @import("std");
const Io = std.Io;

const ziguana = @import("ziguana");

const Example = enum {
    arraylist,
    async,
    cancel,
    dice,
    enums,
    interface,
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
            .arraylist => try ziguana.arraylist.showroom(init.gpa),
            .async => ziguana.async.sums(io),
            .cancel => ziguana.cancel.sleep(io),
            .dice => ziguana.dice.roll(io),
            .enums => ziguana.enums.enumerate(),
            .interface => ziguana.interface.basic(),
            .queue => try ziguana.queue.showroom(io),
            .read => try ziguana.read.fixed(),
            .stdio => try ziguana.stdio.sayThatName(io),
            .write => try ziguana.write.fixed(),
        }
    }
}
