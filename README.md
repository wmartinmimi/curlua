# curlua

simple web interface for lua using curl

## What is it?

A library designed to help lua developers connect to the web

- simple
- small
- single file script
- a hobby project

curlua is a combination of curl and lua.

*I do not own curl though*

## Requirements

- curl installed in user device

## How to use

```lua
require "curlua"

html = curlua.get("https://example.com")

print(html)
```

More examples can be found in project root.

## Issues, Pull requests

Feel free to create issues and pull requests!
Any nice contributions are welcomed.

## License

MIT License (same as lua)
