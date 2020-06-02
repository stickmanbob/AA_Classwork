function sum (...args){
    let sum = 0;

    for (let i=0; i < args.length; i++){
        sum += args[i];
    }
    return sum;
};

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// Function.prototype.myBind = function(context) {
//     let x = this;
//     let args1 = Array.from(arguments).slice(1)
//     let bound = function(){
//         let args = Array.prototype.slice.call(arguments);
//         // args.unshift(context);
//         return x.apply(context,args1.concat(args));
//     };
//     return bound;
// };


Function.prototype.myBind = function(context, ...args) {
    let x = this;
    let args1 = args;
    let bound = function(...args){
        // args.unshift(context);
        return x.apply(context, args1.concat(args));
    };
    return bound;
};



class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true
// markov.says.myBind(pavlov)("meow", "a tree");
// markov.says.myBind(pavlov, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");


function curriedSum(numArgs) { 
    let numbers = [];

    function _curriedSum(x) {
        numbers.push(x);

        if (numbers.length === numArgs) {
            let sum = 0 

            for (let i = 0; i < numbers.length; i++) {
                sum += numbers[i];
            }
            return sum;
        } else {
            return _curriedSum;
        }
    }
    
    return _curriedSum
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56



Function.prototype.curry = function (numArgs) {
    let context = this; 
    let args = [];

    function _curried(...xargs) {
        // args.concat(Array.from(arguments))
        for (let i = 0; i < xargs.length; i++){
            args.push(xargs[i]);
        }

        if (args.length === numArgs) {
            // return context.apply(context, args);
            return context(...args);
        }

        return _curried;
    }   
    return _curried;
}

let a = sum.curry(3);
console.log(a(1)(2)(3));