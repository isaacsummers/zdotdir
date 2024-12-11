## Sequential Execution
`;`: Commands separated by a `;` are executed sequentially. The shell waits for each command to terminate in turn.

```sh
command1; command2
```

## Conditional Execution (AND)
`&&`: The command after `&&` is executed if, and only if, the command before `&&` returns an exit status of zero. You can think of it as an AND operator.

```sh
command1 && command2
```

## Pipe
`|`: A pipe. In the expression `command1 | command2`, the standard output of `command1` is connected via a pipe to the standard input of `command2`.

```sh
command1 | command2
```

## Conditional Execution (OR)
`||`: The command after `||` is executed if, and only if, the command before `||` returns a non-zero exit status. You can think of it as an OR operator. Note that `|` and `||` are completely different.

```sh
command1 || command2
```

## Background Execution
`&`: The shell executes the command terminated by `&` in the background, does not wait for the command to finish, and immediately returns exit code 0. Note that `&` has nothing to do with `&&`.

```sh
command1 &
```

## Pipe with Standard Error
`|&`: A shorthand for `2>&1 |`, i.e., both the standard output and standard error of `command1` are connected to `command2`'s standard input through the pipe.

```sh
command1 |& command2
```

## Disowned Background Execution
Additionally, if you use zsh, you can also start a command with `&|` or `&!`. In this case, the job is immediately disowned; after startup, it does not have a place in the job table.

```sh
&| command1
&! command1
```
