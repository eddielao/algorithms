using System;
using System.Collections.Generic;
using System.Text;

namespace SinglyLinkedList
{
    class Node
    {
        public int value;

        public Node next;

        public Node(int i)
        {
            value = i;
            next = null;
        }
    }
}
