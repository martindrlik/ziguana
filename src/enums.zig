const std = @import("std");

const MetasyntacticVariable = enum { foo, bar, baz };

pub fn basic() void {
    for (std.meta.fieldNames(MetasyntacticVariable)) |name| {
        std.debug.print("{s}\n", .{name});
    }
}
