

Array.prototype.uniq = function() {
  let arr = [];

  this.forEach((ele) => {
    if (!arr.includes(ele)) {
      arr.push(ele);
    }
  });
  return arr;
};

let x = [1,3,-3,5,3,2,6,6,7];
// console.log(x.uniq());



Array.prototype.twoSum = function() {
    let new_arr = [];
    let arr = this;
    let helper = function(ele1,idx1) {
      arr.forEach((ele2,idx2) => {
      if (ele1 + ele2 === 0 && idx2 > idx1) {
        new_arr.push([idx1,idx2]);
        }
      });
    }
    this.forEach(helper);
    return new_arr; 
};

Array.prototype.transpose = function() {
    let arr = new Array(this[0].length).fill(0).map(() => new Array(this.length).fill(0)); 
    let helper = function(sub,idx) {
        sub.forEach((ele,idx2) => {
            arr[idx2][idx] = ele; 
        } );   
    };
    this.forEach(helper);
    return arr; 
};

let y = [[1,1,1],[2,2,2],[3,3,3]];

y.transpose();
