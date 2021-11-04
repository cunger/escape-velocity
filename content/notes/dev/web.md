---
title: "Web Basics"
summary: "TCP/IP. HTTP. REST."
date: 2020-01-10
weight: 3
math: false
toc: true
---

# TCP/IP

Protocols define a language and a set of rules and procedures that enable devices and systems to communicate with each other.

The OSI Reference Model and TCP/IP are two conceptual models for network communication. Both are layered sets of protocols, and the network protocols found in TCP/IP are also contained in OSI.


Layer | Protocol
----- | --------
Application layer | HTTP
Security layer | TSL
Transport layer | TCP
Network layer | IP
Data link layer | Network interfaces

TCP sends data in small chunks (IP packets) which contain:
* bytes of the actual data
* source and destination IP addresses
* information about size + numeric values used for data ordering and integrity checking
This makes it fault-tolerant.

TCP connections are uniquely distinguished by four values:
* source IP + port
* destination IP + port
Such connections involve network protocol handshaking to establish them, as well as segmentation and reassembly of data stream into and from IP packets.

Almost all HTTP communication on the web is carried over TCP/IP.  


# HTTP

The _Hypertext Transfer Protocol_ (HTTP) is a text-based application-level protocol. It regulates the communication between a _server_ (an application) and a _client_ (e.g. a browser). HTTP communication is based on a request/response cycle: The client sends a request, and the server responds to that request.

## Requests

Requests consist of:
* a request method (e.g. GET, POST)
* a path
* a protocol (e.g. HTTP/1.1)
* headers (key-value pairs of form `key: value`, meta data containing supplemental information about the client that sends the request or the resource it requests)
* a body

In HTTP/1.1, required are the request method, the path, as well as the `Host` header.

### Request methods

The method specifies the kind of request that is sent.

* **GET** requests are used for retrieving data, e.g. asking for the representation of a specified resource. They are restricted with respect to length and data type (ASCII character set).  
* **POST** requests are used for submitting data to the server (as part of the request body), and for initializing an action on the server, such as updating an existing resource or creating a new one. They are not restricted with respect to length and data type.
* **HEAD** only asks for the header of a response, e.g. for checking the response status code without actually transferring the resource, in order to check whether the resource exists or has been modified or moved. This can be relevant for caching purposes.  

A request is _safe_ if it does not request any action besides the retrieval of data. E.g. GET, HEAD. Not POST, PUT, DELETE.

A request is _idempotent_ if the result is the same no matter how often it is executed (aside from errors or expiration effects). E.g. GET, HEAD, DELETE. Not POST.

### Examples

```
GET /about HTTP/1.1
-------------------
Host: example.com
User-Agent: ...
-------------------
```

In case of a POST request sending data to the server, this data is sent as the request body:
```
POST /user HTTP/1.1
-------------------
Host: example.com
User-Agent: ...
-------------------
first_name=alice&action=update
```

## Responses

The server responds to the request, either by transferring the requested resource or information, or by indicating the result of an initialized action or the kind of problem that occurred.

* a protocol (e.g. HTTP/1.1)
* a status code
* headers (key-value pairs of form `key: value`, meta data containing information useful for the client, e.g. about the data being sent or the server)
* a body containing the raw response data (e.g. an HTML document or binary data of an image)

Required is the status, all other parts are optional.

Usually a browser issues several requests when pointed to a URL, e.g. requesting resources required to display an HTML page (images, stylesheets, scripts, etc) and following redirects.

### Example

```
HTTP/1.x 200 OK
---------------
Last-Modified: ...
---------------
<html>
...
</html>
```

```
HTTP/1.x 303 See other
---------------
Location: ...
---------------
```

### Status codes

#### 100s: Informational

#### 200s: Successful

* `200` Ok
* `204` Success, no content

#### 300s: Redirections

* `301` Moved permanently (future requests should use new URL)
* `302` Moved temporarily (future requests should use old URL)
* `303` See other

Redirects provide the new URL as HTTP header `Location`.

`Moved` is used when the location of a requested resource was changed.

`See other` is mainly used for responses to POST requests, with the aim of directing the user to the resource that was created or updated by the request. In HTTP/1.1, the expected behavior is that the client sends a GET request to the new URL. (This was also the expected behavior for `302` in HTTP/1.0.)

#### 400s: Client error (problem with request)

* `400` Bad request (i.e. malformed)
* `401` Unauthorized (i.e. client needs to authenticate before having access to the resource)
* `403` Forbidden
* `404` Requested resource was not found
* `408` Request timeout
* `410` Gone (similar to `404`, but saying that the resource used to be there but was removed)

#### 500s: Server error

* `500` Internal server error
* `501` Not implemented (e.g. if a particular HTTP method is not supported)
* `505` HTTP version not supported

## URLs

> A Uniform Resource Identifier (URI) is a compact string of characters for identifying an abstract or physical resource.
> -- https://www.ietf.org/rfc/rfc2396.txt

```
url = scheme "://" host [ ":" port ] [ path [ "#" anchor ] [ "?" query ]]
```

The `scheme` specifies a protocol, telling how the resource can be accessed, e.g. `http`, `https`, `ftp`, `mailto`, `git`.  

The `host` is either a hostname (e.g. `example.com`) or an IP address.

**Example:**
```
https://example.com:3000/character?first_name=elaine&last_name=marley
```

Default `port`s:
* `80` for HTTP
* `443` for HTTPS

The allowed characters in a URL are a subset of the ASCII character set. ASCII characters not in this set (_unsafe_, e.g. `%`) as well as reserved characters (`;`, `/`, `?`, `:`, `@`, `&`, `=`, `+`, `$`, `,`) need to be encoded as `%xx` where `xx` are two hexadecimal digits representing the ASCII code of the character (e.g. `%20` for space).

## HTTP communication

1. The **client**
* extracts the host name from the URL
* gets the IP address for that host name (using DNS)
* gets the port number (either specified in URL or default one)
2. The **client** opens a TCP/IP connection to the IP address with the port
3. The **client** sends an HTTP request to the **server**
4. The **server**
* processes the request
* accesses the required resources
* composes and sends an HTTP response
* usually also logs the transaction
5. The **client** receives the response and processes and displays the data accordingly
6. The client or server closes the connection

HTTP also allows for a chain of HTTP intermediaries between client and server (proxies, caches, etc).

## cURL

```
curl http://localhost:3000
```

```
curl -X GET "http://localhost:3000/books" -v -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:32.0) Gecko/20100101 Firefox/32.0"
```

`-A` for User-Agent
`-H` for headers

```
curl -X POST "http://localhost:3000/login" -d "username=guybrush" -d "password=APirateIWasMeantToBe" -v
```

`-d` results in the data being POST-ed as an `application/x-www-form-urlencoded` string.

## AJAX

_Asynchronous JavaScript and XML_ (AJAX) is used for displaying dynamic content, in particular issuing requests and processing responses without full page refreshes. When triggering a request, the response is handled by a callback (usually a client-side JS function), which then, e.g., updates the HTML page (by directly changing the DOM tree).    

# Statelessness

HTTP is a state-less protocol in the sense that HTTP sessions last for one request: the clients sends a request, and the server sends a response. Each request/response is independent (and unaware) of previous or future ones. The server does not keep information between request/response cycles. This is one of the foundations of a distributed and resilient web.

In order to create a stateful experience, applications usually persist state across distinct HTTP requests by means of sessions - basically places to store data during one request that can be read during later requests. There are different ways to store session data: in cookies (in this case all session information is passed between client and server with each request and response), or on the server in memory/cache or a database (in this case only a session identifier is passed between server and client by means of a cookie).

# HTTP state management mechanism (aka cookies)

Cookies are key-value pairs (`name=value`, separated by `;`) that are stored on the on the client side. Plain text, max 4KB. They are sent with the response to the client, which stores it, and sends it back to the server with each request it makes:
* HTTP response header sent by the server: `Set-Cookie: ...`
* HTTP request header sent by the client: `Cookie: ...`

Cookies can contain session information or a session identifier, which allows the server to relate different requests to each other.

Pre-defined properties include an expiration date ( in `Wdy, DD-Mon-YYYY HH:MM:SS GMT` format) and a scope:
* _Session cookies_ is temporary data that is deleted when the client application (e.g. browser) is closed. They have a set `discard` parameter or don't have an `expires`/`max-age` parameter that indicates an extended life time. _Persistent cookies_, on the other hand side, are stored on the disk and can thus persist across browser sessions.
* _Scoped cookies:_ A `path` and `domain` attribute can be specified to limit the scope of the cookie to a specific domain, sub-domain, or path.

**Example:**

```
Cookie: key=value; expires=Sun, 24-Sep-2017 23:59:59 GMT; path=/; domain=.yoursite.com
```

# Web application security

## HTTPS

Any request and response is plain text, thus vulnerable to being intercepted when sent across a network.

**Secure HTTP (HTTPS) = HTTP + TLS**

HTTPS encrypts each request and response using TLS (Transport Layer Security) (formerly using SSL) before sending them over the network. TLS uses symmetric cryptography, the keys being generated for each connection. Server and client negotiate the encryption algorithm and keys before transmitting any data, using public-key cryptography. Usually also at least the server is authenticated using public-key cryptography.


## Same-origin policy and CORS

Resources from the same origin can access each other without restrictions, where _same origin_ means same protocol, hostname and port. Therefore HTML pages can embed, e.g., scripts from the same origin.

Cross-origin resource sharing (CORS) has been developed to allow resources to also access resources from another origin. Servers can specify in an HTTP header the set of origins that are permitted to send cross-origin requests. In the simplest case, the request states its origin:
```
Origin: http://www.example.com
```
And the response specifies which origins are allowed:  
```
Access-Control-Allow-Origin: http://www.example.com
```
For completely public content (e.g. fonts on Google Fonts):
```
Access-Control-Allow-Origin: *
```

## Session hijacking

Obvious security problems with HTTP:

_Packet sniffing_: intercepting packets sent back and forth between client and server, when attached to the same network
_Session hijacking_: sniffing the session identifier, allowing someone to be logged in without knowing user name and password

**Countermeasures:**

* Use HTTPS for all network communication.
* Reset session IDs: All old session IDs expire (i.e. are no longer valid), both when a new session ID is created as result of a new log in, and after some specified timeout.  
* Requiring authentication when entering sensitive areas (e.g. before changing user account details or charging payments).

## Cross-site scripting (XSS)

Cross-site scripting refers to a client-side code injection attack. This is possible, for instance, when allowing free user input which is then parsed and delivered to other users.

**Example:** An HTML `<textarea>` for submitting a comment, and directly including that content into an HTML page. When submitting a comment with an injected script, e.g. `<script>...</script>`, it will be executed when the HTML page is parsed upon delivery to other users. This way, the web page unintentionally acts as an accomplice in an attack on its users.

In this way it is possible to access user-sensitive information such as cookies, register keystrokes and thus record sensitive information such as passwords, and modify the HTML of the current page, e.g. including a fake login form.  

**Countermeasures:**

* Never insert untrusted data (in HTML, JS, CSS, or other). Always either validate and filter the user input, so that no malicious code is executed, or encode it, e.g. by HTML escaping it, so that the browser interprets it as data, not as code.  
* Secure cookies: `Set-Cookie: blah=blubb; HttpOnly; secure`
  ** `HttpOnly` tells the browser that this cookie should only be accessed by the server (avoiding that it can be accessed by scripts).
  ** `secure` makes sure that cookies are sent only through HTTPS connections.
* Use the HTTP header `Content-Security-Policy`, which tells the browser to not load resources from untrusted sources, execute inline JavaScript, etc. (but still browser-specific).

# REST

REST (_Representational State Transfer_) is a set of conventions to expose URL endpoints that allow you to perform operations on resources that correlate with CRUD actions.

When a client requests a resource via a GET request, the server sends back any machine-readable document containing any information about that resource - basically a representation of that resource and its state. So HTTP, in a way, provides read access to the representation of resources, and write access to the resource's state.

Client and server keep different states:

* Client: application state
* Server: resource state

And they neither know about nor have direct control over the other's state.

A *web server* processes HTTP requests and serves responses back to the client. It implements HTTP and related TCP connection handling (in collaboration with the operating system, which provides hardware-close network support), and also manages its resources.

Usually, a *web server* is a server responding to static assets (files, images, scripts, etc.) that don't require any data processing, while an *application server* hosts the application logic, handling complex requests for running server-side code, often consulting a persistent _data store_.

Server-side code is run on the server before a page is served (e.g. running a template engine to render an HTML page).
Client-side code is run on the client after a page is loaded (e.g. JavaScript updating the HTML page after it was loaded).
The boundary is usually drawn upon considerations such as processing load and security (hiding all application logic vs exposing it to the client).
