Space Plug-and-Play Avionics over CAN bus
=========================================
This document includes some first thoughts on how Space Plug-and-Play Avionics
(SPA) architecture can be used over CAN bus.

## Terms and Definitions
### General
* **UUID**: Universally Unique Identifier
* **URN**: Uniform Resource Name
* **ASIM**: Appliqué Sensor Interface Module

### Space Plug-and-Play Avionics (SPA)
* **SM-x**: SPA Subnet Manager, where x represents a given technology protocol
* **CUUID**: Component Universally Unique Identifier
* **xTEDS**: Extensible Transducer Electronic Data Sheet
* **XUUID**: xTEDS Universally Unique Identifier
* **Central Addressing Service**: The Central Addressing Service (CAS) is
responsible for providing logical address blocks to be assigned to each
hardware or software component. The CAS stores the logical address block
and logical address for each SPA Manager in the SPA Net work.
* **Plug-and-Play (PnP)**: Ability to connect a device to the larger system and
have the two work together with little or no set-up required (e.g., automated
system recognition and data exchange)
* **SPA Lookup Service**: The SPA Lookup Service is responsible for accepting
component registration and providing data source route information for
components requesting a particular type of service (or returning a nack if
the service is not available).
* **SPA Manager**: The SPA manager is responsible for performing discovery for a
particular subnet. It maps incoming packets to the correct SPA endpoint on the
subnet, encapsulating the SPA packet with the correct protocol header. In the
reverse direction it removes the protocol header and possibly adds a new header
conforming to the subnet the packet is about to enter. It is also responsible
for topology discovery and reporting within the subnet.
* **SPA-L / SPA-Local**: The SPA Local Subnet Adaptation specifies the means
by which SPA components interoperate on a local processing node. It specifies
the inter-process communication method used in order to establish a SPA local
network and the messages, protocols, and interactions required in order to
facilitate PnP functionality.

### Controller Area Network (CAN)
* **CAN FD**: CAN with flexible data-rate. Supported from Linux kernel 3.6, can
be tested through virtual CAN interfaces. [Source](http://can-newsletter.org/engineering/standardization/nr_stand_can-fd_linux3.6_120703/).

### Space Plug-and-Play Avionics rationale
* Design and construction of a component can take months or years but assemble
should be counted in hours or days.
* Power supplied through the "same" hardware connector as data transmission.

```
Most likely different wires but in the same cord/connecter.
```

* Use Peer-to-Peer messaging after registration of services.

### CAN bus rationale
* All nodes can read all messages.
* Multiple nodes are not allowed to send messages with the same message id.
* Message IDs are used as priority.

### Requirements
* All nodes must have a unqique message id per payload content and target node.

```
To be able to send a message to one specific node that node must be the only one
listening to a unique message id.

This would also map to the other SPA implementations which has better support
for peer-to-peer communication with different Address Resolution Protocols.
```

### Assumptions
* CAN controllers can be reconfigured during normal operations to listen to a
new set of message ids.

### Combined solution
* All nodes register with a "network master/bus host/component manager/node manager".
* The "network master" asks the new node about its services and requirements in XML.
* The "network master" assign message ids to each node that they are allowed to send.
* The "network master" tells all nodes which message ids they should listen on.

### Limitations
* Number of message ids required.

```
Each node requires a unique id per payload content and remote node. This sooner
rather than later turns into a nightmare when it comes to number of message ids
required. One could argue that several nodes can listen to the same message id
and utilize the broadcasting nature of the CAN bus but then mapping to other
types of SPA networks might be hard.
```

### Problems
* Bootstraping. Which message ID should a new node use when first
contacting the "network master"?
* Message size. (SPA Logical Interface Standard).
The standard for Logical Link Layer says one thing but the specific SPA-1 and
SPA-S says something else when it comes to header size. One could argue that
we can create a SPA-C, for the CAN Bus.

Standard SPA Header uses 16 bytes but CAN bus has a limit on 8
bytes payload. CAN FD from 2012 allow up to 64 bytes of data. The SPA header can
even be extend with another 254 bytes. (Read more in Logical Layer). Maximum size
of a SPA message is 65536 bytes (must be fragmentet somehow).
SPA message footer have CRC with complies with TCP RFC 793.

```
If one message ID is registered as the "Hello network master" message then several
new nodes could send the same message id at the same time. Perhaps a drawback
one can live with?
```

* Message ID assignment only on message type can result in a low utilization of
the CAN bus.

### Requirements not met
* Power supplied through CAN bus.

## Notes from Christoffer
These notes are here to remember som details that may show some value in the
future but does not fit in above.

### SPA Fragmentation
SPA Fragmentation must exist to be able to send messages between different
network types to comply with smaller Maximum Transmission Units (MTUs).
According to SPA Networking Standard the following applies:

A component at the boundary of a SPA subnet may be required to perform
segmentation to meet the requirements of a smaller maximum transmission unit
(MTU). This is considered a possible role for the SM-x entry point to that
subnet, and any fragmentation and reassembly would be discussed in the
appropriate SPA Subnet Adaptation Standard.

### BasicCAN vs FullCAN
FullCAN uses some kind of "mailboxes" which are assigned some kind of value
during initialization. These values can maybe be used as addresses during
bootstraping. Though the cost and complexity of FullCAN instead of BasicCAN
may make it to expensive. At the moment BasicCAN seems to be the winner.

### SPA Component Data Capabilities
Read the details about "Discovery" in SPA Logical Interface Standard

### SPA-L / SPA-Local
SPA-L Well-known port is 3500. SPA Local Subnet Adaption Standard.
A SPA-L network will utilize a RFC 768 User Datagram Protocol/Internet Protocol
(UDP/IP) for Inter Process Communication (IPC) between SPA components on a SPA
processing resource. UDP is one of the core members of the Internet Protocol
Suite. A SPA Local Subnet Manager (SM-L) will provide required component
discovery and messaging communication functions. Each SPA system processing
resource shall have a SM-L.

### SPA-1 / MiniSPA
Uses I2C
Uses Round-robin protocol for communication with all components/nodes.
Mini PnP SPA-1 is based on SPA-U
Do we have I2C on all Generic CAN controllers?

### Document structure
1. SPA basics
2. SPA-C - SPA over CAN Bus - Basic problem statements and solutions
  1. Bootstraping. (random Message ID basically...with 11 or 29 bits it should
     be doable). What about multiple "SM-c"?
  2. What about 8 byte maximum payload size?
  3. Congestions control.
