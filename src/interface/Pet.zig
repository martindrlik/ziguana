const Named = @import("Named.zig");
const Pet = @This();

pet_name: []const u8,
named: Named,

pub fn init(pet_name: []const u8) Pet {
    return .{
        .pet_name = pet_name,
        .named = .init(name),
    };
}

fn name(n: *const Named) []const u8 {
    return pet(n).pet_name;
}

fn pet(n: *const Named) *const Pet {
    return @alignCast(@fieldParentPtr("named", n));
}
