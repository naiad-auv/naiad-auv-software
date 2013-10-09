Space Plug-and-Play Avionics over CAN bus
=========================================
This document includes some first thoughts on how Space Plug-and-Play Avionics
(SPA) architecture can be used over CAN bus.

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

```
If one message ID is registered as the "Hello network master" message then several
new nodes could send the same message id at the same time. Perhaps a drawback
one can live with?
```

* Message ID assignment only on message type can result in a low utilization of
the CAN bus.

### Requirements not met
* Power supplied through CAN bus.

# Notes from Christoffer
These notes are here to remember som details that may show some value in the
future but does not fit in above.

### BasicCAN vs FullCAN
FullCAN uses some kind of "mailboxes" which are assigned some kind of value
during initialization. These values can maybe be used as addresses during
bootstraping. Though the cost and complexity of FullCAN instead of BasicCAN
may make it to expensive. At the moment BasicCAN seems to be the winner.
