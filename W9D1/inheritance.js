// Function.prototype.inherits = function(Parent) {
//     function Surrogate() {

//     }

//     Surrogate.prototype = Parent.prototype;

//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };

Function.prototype.inherits = function(Parent) {
    this.prototype = Object.create(Parent.prototype);
    this.prototype.constructor = this; 
}

function MovingObject() { 
    
}



MovingObject.prototype.hello = function(){
    console.log("hello");
};

function Ship(title) { 
    this.title = title;
}

Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

let a = new Ship("a");

a.hello();
console.log(a.title);

let b = new Asteroid();
b.hello();
console.log(b.title);