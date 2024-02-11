---
title: "Network programming"
description: "Work in progress"
author: "Christina Unger"
tags: ["network"]
date: 2024-02-11
lastmod: 2024-02-11
draft: false
---

# Computer networking 101

The point of a network is to send data between machines. 

The nodes of the network are physical devices like computers or printers. The connection between them can be wired, for example Ethernet cables, or wireless, like WiFi.

Each physical node has a network interface card, a piece of hardware that can translate between digital data and the signals sent over the network.

Since the operating system controls access to hardware, it controls the network interface. In order for software to be able to use that hardware, the operating system offers an API: the sockets API.

Sockets are the software endpoints for sending and receiving data. They thus represent software handles at one end of the connection of a machine to the network. 
Technically, sockets are file descriptors for a network connection, identified by a socket address, which comprises a protocol, an IP address and a port.

Communication happens following a protocol, i.e. a standard on how data is exchanged.

## Layers

We start with a data payload that we want to send. Each layer adds a header and passes the result downwards, until we hit the physical layer where the data is sent - and received at the destination, where each layer header is peeled off when passing the data upwards.

**Application layer** 

For example:
```
| HTTP header | data payload |
```

**Transport layer** 

Protocols like TCP and UDP add a header that allows for splitting the payload into packages and being able to re-assemble them at the destination, possibly including information on their order and for error detection (ensuring data integrity). 

The Transmission Control Protocol (TCP) is reliable, ordered and error-checked.
```
| TCP header | HTTP header | data payload |
```

The User Datagram Protocol (UDP) is connectionless, more like send and forget, and thus much faster. 
Used for applications like video and voice streaming, where real-time is more important than recovering single packets that might have been lost.
```
| UDP header | HTTP header | data payload |
```

**Routing**

The Internet Protocol (IP) is a connectionless protocol, the principal communication protocol for the internet. Packets (also called datagrams) are routed from source to destination based on an IP address.

```
| IP header | TCP header | HTTP header | data payload |
| IP header | UDP header | HTTP header | data payload |
```

**Network**

```
| Ethernet header | IP header | UDP header | HTTP header | data payload |
```
Data link, connects to the physical layer.

## Connection process at the transport level

Mentioned functions are those provided by the socket API.

`socket()` asks the operating system to create a socket and allocate resources to it. Arguments:

  - domain (address or protocol families, for example `PF_INET` for IPv4, `PF_INET6` for IPv6, `PF_UNIX` for local socket)
  - type (for example `SOCK_STREAM` for stream socket, `SOCK_DGRAM` for datagram sockets, `SOCK_RAW` for raw socket)
  - protocol (specifying the transport protocol, for example `IPPROTO_TCP` or `IPPROTO_UDP`)

Returns a file handler identified by an integer (-1 if an error occured).

### TCP

TCP is for sending data reliably, i.e. when it matters that all data is received (so lost data is re-sent), and their order can be established.

Server:

* `socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)`: Ask the operating system to create a TCP socket.

* `bind()`: Associate the socket with an IP address and port (the socket address).

* `listen()`: Wait for connection requests. (sleeps and OS wakes it up?)

* `accept()`: Accept an incoming connection request. Creates a new socket descriptor dedicated to that connection.

* `send()`, `recv()`: Send and receive data.

* `close()`: Close the connection socket.

Client: 

* Create a socket.

* `gethostbyname/gethostbyaddr()`: DNS lookup to resolve host.

* `connect()`: Assign a free local port to the socket and try to establish a TCP connection with the server via 3-way handshake:

  - Client sends: `SEQ=X, CTL=SYN` (new client sequence number, ideally an integer than cannot be easily guessed)
  - Server responds: `SEQ=Y, ACK=X+1, CTL=SYN,ACK` (new server sequence number, client sequence number is acknowledged by adding 1 to it)
    If the port is closed, the server responds with `RST`
  - Client responds: `SEQ=X+1, ACK=Y+1, CTL=ACK` (acknowledge client sequence number, and server sequence number is acknowledged by adding 1 to it)

* Send and receive data.

### UDP

The UDP address space, i.e. the ports used, are disjoint from TCP ports.

connection-less: send and forget

Server: 

* `socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)`
* `bind()`
* `recvfrom()`

Client: 

* `socket()`
* `sendto()`

# Port scanning

## The crude, top-level approach

Establish a TCP connection, and then close it again.

```
s = socket(AF_INET, SOCK_STREAM)
try
  s.connect((host, port))
  It's open.
  s.close()
catch 
  It's closed.
```

```ada
Socket : Socket_Type;

Create_Socket (Socket);
-- connect
Close_Socket (Socket);
```

## The SYN approach

Don't establish a full connection. Instead, only try to initiate a connection by sending the first SYN packkage for a TCP handshake, and inspect the repsonse.

This means manually crafting a TCP/IP package, including

* IP header
* TCP header
  - source port
  - destination port
  - sequence number (SEQ)
  - acknowledgement number (ACK)
  - ...
  - TCP checksum 

and sending it through the network via a raw socket. 

Option 1:
```
packet = ip_header + tcp_header

s = socket(AF_INET, SOCK_RAW, IPPROTO_TCP)
s.setsockopt(IPPROTO_IP, IP_HDRINCL, 1)
s.sendto(packet, <destination>)
```

Option 2:
```
packet = ethernet + ip_header + tcp_header

s = socket(AF_PACKET, SOCK_RAW)
s.bind(("eth0", 0))
s.send(packet)
```

# References

inc0x0
- [TCP/IP packets](https://inc0x0.com/tcp-ip-packets-introduction/)
- https://inc0x0.com/tcp-ip-packets-introduction/tcp-ip-packets-3-manually-create-and-send-raw-tcp-ip-packets/ 
- https://inc0x0.com/tcp-ip-packets-introduction/tcp-ip-packets-4-creating-a-syn-port-scanner/

beej.us
- [Beej's Guide to Networking Concepts](https://beej.us/guide/bgnet0/)
- [Beej's Guide to Network Programming](https://beej.us/guide/bgnet/)


https://sock-raw.org/papers/sock_raw


https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Well-known_ports