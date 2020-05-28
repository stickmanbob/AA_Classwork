
Array.prototype.myEach = function(callback) {
  for (i = 0; i < this.length; i++) {
    callback(this[i],i);
  }
  return undefined;
}; 

// Array.prototype.uniq = function () {
//     let arr = [];

//     this.myEach((ele) => {
//         if (!arr.includes(ele)) {
//             arr.push(ele);
//         }
//     });
//     return arr;
// };

// let x = [1, 3, -3, 5, 3, 2, 6, 6, 7];
// x.uniq();

Array.prototype.myMap = function(callback) {
  let result = [];
  this.myEach((ele) => {
    result.push(callback(ele));
  });
  return result;
};

// Array.prototype.transpose = function () {
//   let arr = new Array(this[0].length).fill(0).myMap(() => new Array(this.length).fill(0));
//   let helper = function (sub, idx) {
//     sub.forEach((ele, idx2) => {
//       arr[idx2][idx] = ele;
//     });
//   };
//   this.forEach(helper);
//   return arr;
// };

// y.transpose();

Array.prototype.myReduce = function (callback, initial=null) {
  if (initial === null){
    acc = this[0];
    start = 1;
  }else {
    acc = initial;
    start = 0;
  }   
  for (i = start; i < this.length; i++) {
    acc = callback(acc, this[i]);
  }
  return acc
};

// // without initialValue
// [1, 2, 3].myReduce(function (acc, el) {
//     return acc + el;
// }); // => 6

// // with initialValue
// [1, 2, 3].myReduce(function (acc, el) {
//     return acc + el;
// }, 25); // => 31

Array.prototype.bubbleSort = function(callback){
  let sorted = false;
  let arr = this;
  let sort = function(ele,idx){
    if (callback(ele,arr[idx+1])) {
        arr
    }
  };
  while(!sorted){
    sorted = true
    this.myEach(sort)
  }
};

