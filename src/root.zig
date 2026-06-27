const std = @import("std");
const Io = std.Io;

pub const async = @import("async.zig");
pub const cancel = @import("cancel.zig");
pub const dice = @import("dice.zig");
pub const stdio = @import("stdio.zig");

pub fn diceRoll(io: Io) void {
    std.debug.print("The result of the dice roll is {d}\n", .{dice.roll(io)});
}
