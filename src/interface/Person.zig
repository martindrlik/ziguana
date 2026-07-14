const Named = @import("Named.zig");
const Person = @This();

first_name: []const u8,
named: Named,

pub fn init(first_name: []const u8) Person {
    return .{
        .first_name = first_name,
        .named = .init(name),
    };
}

fn name(n: *const Named) []const u8 {
    return person(n).first_name;
}

fn person(n: *const Named) *const Person {
    return @alignCast(@fieldParentPtr("named", n));
}
