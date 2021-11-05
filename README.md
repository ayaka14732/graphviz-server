# graphviz-server

A server that renders graphviz image from HTTP requests.

Under development.

## Motivation

Render graph images on webpage.

## Usage

Example: https://ayaka-apps.shn.hk/graphviz/?src=digraph%20G%20%7B%0A%20bgcolor%3Dtransparent%0A%20A%20-%3E%20B%3B%0A%7D

![](https://ayaka-apps.shn.hk/graphviz/?src=digraph%20G%20%7B%0A%20bgcolor%3Dtransparent%0A%20A%20-%3E%20B%3B%0A%7D)

Query string:

- `src`: graphviz source code
- `format`: currently one of 'svg', 'png', 'gif', 'pdf'

## Run

```sh
$ docker build -t graphviz-server https://github.com/ayaka14732/graphviz-server.git
$ docker run -d -p "127.0.0.1:25001:8080" --name=graphviz-server-box graphviz-server
```
