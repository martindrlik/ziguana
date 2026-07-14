const Named = @This();

vtable: VTable,

pub fn init(name_fn: *const fn (n: *const Named) []const u8) Named {
    return .{ .vtable = .{ .name = name_fn } };
}

pub const VTable = struct {
    name: *const fn (n: *const Named) []const u8,
};

pub fn name(n: *const Named) []const u8 {
    return n.vtable.name(n);
}
