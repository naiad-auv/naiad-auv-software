Space Plug-and-Play Avionics over CAN bus
=========================================
This document includes some first thoughts on how Space Plug-and-Play Avionics
(SPA) architecture can be used over CAN bus.

### Space Plug-and-Play Avionics
1. Design and construction can take weeks and years but assemble of components
should be counted in hours or days.
2. Power supplied through the "same" hardware connector as data transmission.
```
Most likely different wires but in the same cord/connecter.
```
3. Use Peer-to-Peer messaging after registration of services.

### CAN bus
1. All nodes can read all messages.
2. Multiple nodes are not allowed to send messages with the same message id.

### Requirements
1. All nodes must have a unqique message id per payload content and target node.
```
To be able to send a message to one specific node that node must be the only one
listening to a unique message id.

This would also map to the other SPA implementations which has better support
for peer-to-peer communication with different Address Resolution Protocols.
```
### Assumptions
1. CAN controllers can be reconfigured during normal operations to listen to a
new set of message ids.

### Combined solution
1. All nodes register with a "network master/bus host/component manager/node manager".
2. The "network master" asks the new node about its services and requirements in XML.
```
The
```

3. The "network master" assign message ids to each node that they are allowed to send.

4. The "network master" tells all nodes which message ids they should listen on.

### Limitations
1. Number of message ids required.
```
Each node requires a unique id per payload content and remote node. This sooner
rather than later turns into a nightmare when it comes to number of message ids
required. One could argue that several nodes can listen to the same message id
and utilize the broadcasting nature of the CAN bus but then mapping to other
types of SPA networks might be hard.
```

### Problems
1. Which message ID should a new node use when first contacting the "network master"?
```
If one message ID is registered as the "Hello network master" message then several
new nodes could send the same message id at the same time. Perhaps a drawback
one can live with?
```

### Requirements not met
1. Power supplied through CAN bus.
