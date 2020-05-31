const readline = require('readline');
reader = readline.createInterface({input: process.stdin, output: process.stdout});

let addNumbers = function (sum, numsLeft, completionCallback) {
  reader.question('Enter a number:', addSum.bind(this));
  
  function addSum(num) {
    sum += parseInt(num, 10);
    numsLeft -=1;
    console.log(sum);

    if (numsLeft === 0){
      reader.close();
      return completionCallback(sum);
    }else {
      return addNumbers(sum, numsLeft, completionCallback);
    }
  }
  
} 



addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

 