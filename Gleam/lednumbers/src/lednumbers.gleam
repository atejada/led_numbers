import gleam/dict.{type Dict, new, insert, get}
import gleam/string
import gleam/list
import gleam/io
import gleam/result

@external(erlang, "io", "get_line")
fn get_line(prompt: String) -> String

pub fn main() {
  let leds = led_map()

  let input =
    get_line("Enter a number: ")
    |> string.trim()

  render(input, leds)
}

fn led_map() -> Dict(String, List(String)) {
  new()
  |> insert("0", [" _ ", "| |", "|_|"])
  |> insert("1", ["   ", " | ", " | "])
  |> insert("2", [" _ ", " _|", "|_ "])
  |> insert("3", [" _ ", " _|", " _|"])
  |> insert("4", ["   ", "|_|", "  |"])
  |> insert("5", [" _ ", "|_ ", " _|"])
  |> insert("6", [" _ ", "|_ ", "|_|"])
  |> insert("7", [" _ ", "  |", "  |"])
  |> insert("8", [" _ ", "|_|", "|_|"])
  |> insert("9", [" _ ", "|_|", " _|"])
}

fn render(number: String, leds: Dict(String, List(String))) {
  let digits = string.to_graphemes(number)

  let rendered =
    digits
    |> list.map(fn(digit) {
      get(leds, digit)
      |> result.unwrap(["   ", "   ", "   "])
    })

  let line1 =
    rendered
    |> list.map(fn(parts) {
      case parts {
        [a, _, _] -> a
        _ -> "   "
      }
    })
    |> string.join(" ")

  let line2 =
    rendered
    |> list.map(fn(parts) {
      case parts {
        [_, b, _] -> b
        _ -> "   "
      }
    })
    |> string.join(" ")

  let line3 =
    rendered
    |> list.map(fn(parts) {
      case parts {
        [_, _, c] -> c
        _ -> "   "
      }
    })
    |> string.join(" ")

  io.println(line1)
  io.println(line2)
  io.println(line3)
}
