const TestCase = struct {
    input: []const u8,
};

pub const tc = [_]TestCase{
    .{ .input = "1 + 1", .output = mks.number(2) },
};
