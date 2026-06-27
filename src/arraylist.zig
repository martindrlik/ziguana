const std = @import("std");
const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

pub fn showroom(gpa: Allocator) !void {
    var list: ArrayList(u8) = .empty;
    defer list.deinit(gpa);
    try list.append(gpa, 1);
    try list.append(gpa, 2);
    try list.append(gpa, 3);
    for (list.items) |u| {
        std.debug.print("value: {d}\n", .{u});
    }
    while (true) {
        const u = list.pop() orelse break;
        std.debug.print("popped value: {d}\n", .{u});
    }
}
