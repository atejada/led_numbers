const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var map = std.StringHashMap([]const u8).init(allocator);
    defer map.deinit();

    try map.put("0", " _  ,| | ,|_| ");
    try map.put("1", "    ,  | ,  | ");
    try map.put("2", " _  , _| ,|_  ");
    try map.put("3", " _  , _| , _| ");
    try map.put("4", "    ,|_| ,  | ");
    try map.put("5", " _  ,|_  , _| ");
    try map.put("6", " _  ,|_  ,|_| ");
    try map.put("7", " _  ,  | ,  | ");
    try map.put("8", " _  ,|_| ,|_| ");
    try map.put("9", " _  ,|_| , _| ");

    var buffer: [100]u8 = undefined;

    std.debug.print("Enter a number: ", .{});

    const stdin = std.fs.File.stdin();
    const bytes_read = try stdin.read(&buffer);

    var num = buffer[0..bytes_read];

    if (num.len > 0 and num[num.len - 1] == '\n') {
        num = num[0..num.len - 1];
    }

    var row1 = try std.ArrayList(u8).initCapacity(allocator, 0);
    var row2 = try std.ArrayList(u8).initCapacity(allocator, 0);
    var row3 = try std.ArrayList(u8).initCapacity(allocator, 0);
    defer row1.deinit(allocator);
    defer row2.deinit(allocator);
    defer row3.deinit(allocator);

    for (num) |char| {
        var key_buf: [1]u8 = .{char};

        if (map.get(key_buf[0..])) |digit| {
            var it = std.mem.splitScalar(u8, digit, ',');

            const part1 = it.next().?;
            const part2 = it.next().?;
            const part3 = it.next().?;

            try row1.appendSlice(allocator, part1);
            try row2.appendSlice(allocator, part2);
            try row3.appendSlice(allocator, part3);
        } else {
            std.debug.print("\nInvalid character: {c}\n", .{char});
            return;
        }
    }

    std.debug.print("\n{s}\n", .{row1.items});
    std.debug.print("{s}\n", .{row2.items});
    std.debug.print("{s}\n", .{row3.items});
}

