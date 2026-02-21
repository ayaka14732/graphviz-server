# Graphviz Server

A server that renders graphviz image from web requests.

## Motivation

Render graph images on webpage.

## Example

Graphviz source:

```graphviz
digraph G {
 bgcolor=grey
 A -> B;
}
```

URI encode:

https://graphviz.shn.hk/?src=digraph%20G%20%7B%0A%20bgcolor%3Dgrey%0A%20A%20-%3E%20B%3B%0A%7D

Result:

![](https://graphviz.shn.hk/?src=digraph%20G%20%7B%0A%20bgcolor%3Dgrey%0A%20A%20-%3E%20B%3B%0A%7D)

## API Usage

Query string:

- `src`: graphviz source code
- `format`: currently one of 'svg', 'png', 'gif', 'pdf'

## Supported Scripts

- CJK Characters
- Emoji
- Khmer
- Latin

Please open an issue if you want more writing systems to be supported.

## Deploy

The service is supposed to be deployed with Docker containers.
