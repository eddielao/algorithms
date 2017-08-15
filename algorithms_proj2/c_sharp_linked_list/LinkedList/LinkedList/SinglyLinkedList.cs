using System;
using System.Collections.Generic;
using System.Text;

namespace SinglyLinkedList
{
    class SinglyLinkedList
    {
        private Node head;

        public SinglyLinkedList()
        {
            head = null;
        }

        public void DisplayLinkList()
        {
            Node n;

            if (this.IsEmpty())
            {
                Console.WriteLine("This singly linked list is empty!");
            }
            else
            {
                n = head;
                Console.Write("Singly Linked List: Head ");
                while (n != null)
                {
                    Console.Write(n.value);
                    n = n.next;
                }
                Console.Write(" Tail");
            }
        }

        public void CountNodes()
        {
            int nodeCount = 0;
            Node n;

            if (this.IsEmpty())
            {
                Console.WriteLine("This singly linked list is empty!");
            }
            else
            {
                n = head;
                while (n != null)
                {
                    nodeCount++;
                    n = n.next;
                }
            }

            Console.WriteLine("Number of nodes: " + nodeCount);
        }

        public Node Search(int val)
        {
            Node n;
            Boolean found = false;

            if (this.IsEmpty())
            {
                Console.WriteLine("This singly linked list is empty!");
            }
            else
            {
                n = head;

                while (n != null)
                {
                    if (n.value == val)
                    {           
                        break;
                    }
                    else
                    {
                        n = n.next;
                    }
                }
            }

            return n;
        }

        public Node InsertAt(int index)
        {

        }

        public Boolean IsEmpty()
        {
            return head == null ? true : false;
        }
    }    
}
