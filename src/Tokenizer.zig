const std = @import("std");

pub const TokenIter = struct {
    input: []const u8,
    idx: usize = 0,

    pub fn next(self: *TokenIter) ?Token {
        _ = self;
    }
};

pub const Number = struct {
    val: i64,
};

pub const String = struct {
    data: []const u8,
};

pub const Operator = enum {
    add,
    sub,
    mul,
    div,

    shl,
    shr,
};

pub const Syntax = enum {
    open_paren,
    close_paren,

    open_bracket,
    close_bracket,

    open_brace,
    close_brace,

    comma,
    semi_colon,
};

pub const Token = struct {
    data: []const u8,
    value: TokenValue,
    pub const TokenValue = union(enum) {
        number: Number,
        syntax: Syntax,
        operator: Operator,
    };
};

pub const TokenMatch = union(enum) {
    simple: SimpleMatch,

    pub const SimpleMatch = struct {
        str: []const u8,
        val: Token.TokenValue,
    };
};

pub const Tokens = [_]TokenMatch{
    .{ .simple = .{ .str = "+", .val = .{ .operator = .add } } },
    .{ .simple = .{ .str = "-", .val = .{ .operator = .sub } } },
    .{ .simple = .{ .str = "*", .val = .{ .operator = .mul } } },
    .{ .simple = .{ .str = "/", .val = .{ .operator = .div } } },

    .{ .simple = .{ .str = "<<", .val = .{ .operator = .shl } } },
    .{ .simple = .{ .str = ">>", .val = .{ .operator = .shr } } },

    .{ .simple = .{ .str = "(", .val = .{ .syntax = .open_paren } } },
    .{ .simple = .{ .str = ")", .val = .{ .syntax = .close_paren } } },
    .{ .simple = .{ .str = "[", .val = .{ .syntax = .open_bracket } } },
    .{ .simple = .{ .str = "]", .val = .{ .syntax = .close_bracket } } },
    .{ .simple = .{ .str = "{", .val = .{ .syntax = .open_brace } } },
    .{ .simple = .{ .str = "}", .val = .{ .syntax = .close_brace } } },
    .{ .simple = .{ .str = ",", .val = .{ .syntax = .comma } } },
    .{ .simple = .{ .str = ":", .val = .{ .syntax = .semi_colon } } },
};
