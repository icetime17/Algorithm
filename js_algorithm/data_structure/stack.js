console.log(">>>>>>>>>> stack");

class Stack {
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
    return this.array[this.array.length - 1];
  }

  bottom() {
    return this.array[0];
  }

  push(ele) {
    this.array.push(ele);
  }

  pop() {
    this.array.pop();
  }
}

var s = new Stack();
console.log(s.isEmpty()); // true
s.push(1);
s.push(2);
s.push(3);
s.push(4);
console.log(s); // 1,2,3,4
s.pop();
console.log(s); // 1,2,3
console.log(s.top()); // 3
console.log(s.bottom()); // 1
console.log(s.isEmpty()); // false
