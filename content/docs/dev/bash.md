---
title: "Bash"
summary: "Boom. Bang."
date: 2020-01-10
weight: 2
math: false
toc: true
---

# Commands

## Simple commands

```
[ var=value ... ] name [ arg ... ] [ redirection ... ]
```

The variable assignments apply to the environment of this one command.

To figure out what to execute, bash uses the `name` to search for:

* a function (i.e. a previously declared block of commands)
* a builtin
* a program (i.e. an external command; bash will look into `PATH` for finding it)

```
$ type -a echo
echo is a shell builtin
echo is /bin/echo

$ type -a ping
ping is /bin/ping

$ type -a ls
ls is aliased to `ls --color=auto'
ls is /bin/ls
```

## Composing commands

```
[!] command [ | command ... ]
```

The pipe `|` connects the standard output file descriptor of the first command to the standard input file descriptor of the second one.
Using `|&` also connects the standard error of the first command to the input of the second one (which obviously only makes sense if it can handle error messages).

```
command ; command
```

Execute the first one, then execute the second one.

```
command && command
command || command
```

`&&`: Execute the second one only of the first one was successful (i.e. returns exit code 0).  
`||`: Execute the second one only of the first one failed (i.e. returns exit code 1 or higher).

# Exit codes

If a script does not specify an exit code, its exit code will be the exit code of the last command run.
The exit code of the last command run is accessible via `$?`, for example:

```bash
touch some.file

if [ $? -eq 0 ]
then
  echo "Successfully touched file"
  exit 0
else
  echo "Could not touch file" >&2
  exit 1
fi
```

See also [reserved exit codes](http://www.tldp.org/LDP/abs/html/exitcodes.html).

# File descriptors

Bash has three standard file descriptors:

* standard input (`0`, keyboard)
* standard output (`1`, terminal display)
* standard error (`2`, terminal display)

Every process started by bash will inherit those, unless they are explicitly changed by redirection. For example:
```
echo "Fnord!" >log.text 2>/dev/null
```

Note that `>` defaults to `1>`. Also, if you want to send both output and errors to the same stream, you need to duplicate the file descriptor, e.g. `command >file 2>&1`. Otherwise there will be two streams writing to the same descriptor, which gives unpredictable results.
Also note that redirections are evaluated from left to right.

Redirections with `>` are for output (where `>>` appends to the end of a file), redirections with `<` are for input (e.g. `read line <file`, where `<` defaults to `0<`).

`&>` redirects both `1` and `2` to a file (or `&>>` for appending), e.g.:
```
ping 127.0.0.1 &>log
```

# Variables

* All variables declared inside a function will be shared with the calling environment.
* All variables declared `local` will not be shared.

Variable assignment with default value: `${VAR:-Default}`. Use `1` a `VAR` for `$1`, for example:
```
local value=${1:-"Fnord"}
```

# Parameter expansions

For a full list, see the [Bash reference](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion).

* `${parameter:-word}`

    If `parameter` is unset or null, the expansion of `word` is substituted. Otherwise, the value of `parameter` is substituted.

* `${parameter:=word}`

    If `parameter` is unset or null, the expansion of `word` is assigned to `parameter`. The value of `parameter` is then substituted. Positional parameters and special parameters may not be assigned to in this way.

* `${parameter:offset}` and `${parameter:offset:length}`

    Substring expansion: expands to up to `length` characters of the value of `parameter` starting at the character specified by `offset`.

* `${#parameter}`

    The length in characters of the expanded value of `parameter` is substituted.

# Quoting

Double quotes allow for expansion, such as `"Good morning, $USER."`; single quotes don't, e.g. `'You are SECOND place and win $10.'`.

## The importance of quoting

Always quote variable expansions! As in `echo "$result"`, or `fun "$1" "$2"`.

Also, when in doubt, quote. For example:
```
$ rm -vr /home/$username
```
If `$username` accidentally contains a space as first character, the whole `/home` directory will be deleted. This will not happen when the argument is quoted:
```
$ rm -vr "/home/$username"
```

# Conditionals and tests

Use `[[` for strings and `((` for numerals.

# Loops

```
while read url
do
  curl "$url" >> collected_results.html
done < list_of_urls.txt
```

```
$ touch file{0,1,2,3,4}.txt
```

```
$ ls -ld {,usr,usr/local}/{bin,sbin,lib}
```
