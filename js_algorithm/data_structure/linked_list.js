
class LinkedListNode {
  constructor(value) {
    this.value = value;
  }

  visit() {
    console.log(this.value);
  }

  isEqual(node) {
    return this.value === node.value
  }
}

class LinkedList {
  constructor (head) {
    this.head = head
  }

  isEmpty () {
    return this.head == null
  }

  count() {
    var node = this.head;
    if (!node) {
      return 0;
    }

    var c = 1;
    while (node.next) {
      node = node.next;
      c += 1;
    }
    return c;
  }

  first() {
    return this.head;
  }

  last () {
    var node = this.head;
    if (!node) {
      return;
    }

    while (node.next) {
      node = node.next;
    }
    return node;
  }

  append(node) {
    var last = this.last();
    if (!last) {
      this.head = node;
    } else {
      node.pre = last;
      last.next = node;
    }
  }

  insert(node, index) {

  }

  removeAll() {
    this.head = null
  }

  reverse() {
    var node = this.head;
    if (!node) {
      return;
    }

    node.visit();

    var pre, next;
    while (node.next) {
      pre = node.pre;
      next = node.next;

      node.pre = next;
      node.next = pre;

      this.head = node;
    }
  }

  visit() {
    var node = this.head;
    if (!node) {
      return;
    }

    node.visit();
    while (node.next) {
      node = node.next;
      node.visit();
    }
  }
}

var a = new LinkedListNode("A")
var b = new LinkedListNode("B")
var c = new LinkedListNode("C")
var d = new LinkedListNode("D")
var e = new LinkedListNode("E")
/*
a.next = b;
b.pre = a;
b.next = c;
c.pre = b;
c.next = d;
d.pre = c;
d.next = e;
e.pre = d;
a.visit() // A
b.visit() // B
c.visit() // C
d.visit() // D
e.visit() // E
*/

console.log("")

var listEmpty = new LinkedList();
listEmpty.visit();
console.log(listEmpty.first());
console.log(listEmpty.last());

console.log("")

var list = new LinkedList(a);
console.log(list);
console.log(list.count());
console.log(list.isEmpty())
list.head.visit(); // A

console.log("")

list.append(b);
list.append(c);
list.append(d);
list.append(e);

list.first().visit(); // A
list.last().visit(); // E

list.visit();
list.reverse();
console.log("")
list.visit();
