# Cli Plugin Library

> We provide some std library for **lua** plugin interaction.

## Log

- `trace(message: string)` - print *trace* log message.
- `debug(message: string)` - print *debug* log message.
- `info(message: string)` - print *default* log message.
- `warn(message: string)` - print *warning* log message.
- `error(message: string)` - print *error* log message.

## Tool

- `dump(object: Table)` - format return table object.

## Command

- `exec(cmd: array[string], stdout: stdio, stderr: stdio)` - execute a command.
  - `stdio`: `string enum: "inhert" | "piped" | "null"` - `default: inhert`
- `execQuiet(cmd: array[string])` - execute a command with *quiet* mode.
- `execSimple(cmd: string)` - execute a string command.

