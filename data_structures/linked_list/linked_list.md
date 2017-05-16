# Linked List

### Characteristics

Any operation starts with the root note which is the first node. Each node points to the next node. The last node is distinguished by pointing to `NULL`. Unlike array, linked list does not have random access (by index).


### Linked List Operations

**Insertion**at start: O(1) constant time complexity

&nbsp;&nbsp;&nbsp;&nbsp;
Make the new node to be inserted point to the current first node.

**Insertion**at end: O(N) linear time complexity

&nbsp;&nbsp;&nbsp;&nbsp;
Before insertion can take place, the function has to traverse down the linked list till reaching the last node, which points to `NULL`.

**Remove**at start: O(1) constant time complexity

&nbsp;&nbsp;&nbsp;&nbsp;
This is done by removing the pointer of the current root node.

**Remove**at given value: O(N) linear time complexity

&nbsp;&nbsp;&nbsp;&nbsp;
Starting at the root, we search each node until we find the value to be removed. Set the target node to `NULL` and then update the pointer of its previous node to point to the next node down the list.