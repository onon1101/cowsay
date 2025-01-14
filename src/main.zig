const std = @import("std");

pub fn main() !void {
    var str = try std.heap.page_allocator.alloc(u8, 0);
    // defer std.heap.page_allocator.free(str);
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    for (args) |arg| {
        // str = try std.mem.concat(std.heap.page_allocator, str, arg);
        const slices = [_][]const u8{ str, " ", arg };
        str = try std.mem.concat(std.heap.page_allocator, u8, &slices);
        std.debug.print(" {s}\n", .{arg});
    }

    std.debug.print(" ____\n", .{});
    std.debug.print("< {s} >\n", .{str[1..]});
    std.debug.print(" ----\n", .{});
    std.debug.print("        \\   ^__^\n", .{});
    std.debug.print("         \\  (oo)\\_______\n", .{});
    std.debug.print("            (__)\\       )\\/\\ \n", .{});
    std.debug.print("                ||----w |\n", .{});
    std.debug.print("                ||     ||-\n", .{});
}
