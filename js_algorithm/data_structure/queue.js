console.log(">>>>>>>>>> stack");

class Queue {
  constructor() {
    this.array = [];
  }

  isEmpty() {
    return this.array.length == 0;
  }

  count() {
    return this.array.length;
  }

  top() {
    return this.array[0];
  }

  bottom() {
    return this.array[this.array.length - 1];
  }

  enqueue(ele) {
    this.array.push(ele);
  }

  dequeue() {
    this.array.shift();
  }
}

// 引入head变量，存储当前实际首元素的index
// dequeue操作时并不将剩下元素向前shift，而是将dequeue的空位留着，定期执行trim操作清空空位即可
// trim操作的复制度为O(n)，但dequeue的平均复杂度降为O(1)。
class Queue_Optimized {
  constructor() {
    this.array = [];
    this.head = 0; // 实际有效的首元素所在的index
  }

  isEmpty() {
    return this.array.length - this.head == 0;
  }

  count() {
    return this.array.length - this.head;
  }

  top() {
    if (this.array.count == 0) {
      return null;
    }
    return this.array[this.head];
  }

  bottom() {
    if (this.array.count == 0) {
      return null;
    }
    return this.array[this.array.length - 1]
  }

  enqueue(ele) {
    this.array.push(ele);
  }

  dequeue(ele) {
    if (this.array.length - this.head <= 0) {
      return null
    }

    const headElement = this.array[this.head];
    this.array[this.head] = null,
    this.head += 1;

    if (this.head == this.array.length) {
      this.array = [];
      this.head = 0;
    }

    return headElement;
  }
}

var s = new Queue();
console.log(s.isEmpty()); // true
s.enqueue(1);
s.enqueue(2);
s.enqueue(3);
s.enqueue(4);
console.log(s); // [1,2,3,4]
s.dequeue();
console.log(s); // [2,3,4]
console.log(s.top()); // 2
console.log(s.bottom()); // 4
console.log(s.isEmpty()); // false

console.log("")

var so = new Queue_Optimized();
console.log(so.isEmpty()); // true
so.enqueue(1);
so.enqueue(2);
so.enqueue(3);
so.enqueue(4);
console.log(so); // [1,2,3,4], head = 0
so.dequeue();
console.log(so); // [null,2,3,4], head = 1
console.log(so.top()); // 2
console.log(so.bottom()); // 4
console.log(so.isEmpty()); // false
so.dequeue();
console.log(so); // [null,null,3,4], head = 2
so.dequeue();
console.log(so); // [null,null,null,4], head = 3
so.dequeue();
console.log(so); // [], head = 0
