const std = @import("std");
const Named = @import("Named.zig");
const Person = @import("Person.zig");
const Pet = @import("Pet.zig");

pub fn basic() void {
    const martina: Person = .init("Martina");
    const abby: Pet = .init("Abby");
    printName(&martina.named);
    printName(&abby.named);
}

fn printName(n: *const Named) void {
    std.debug.print("The name is {s}.\n", .{n.name()});
}
