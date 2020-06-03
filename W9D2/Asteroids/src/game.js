const Asteroid = require("./asteroid");
const Ship = require("./ship.js")
const Bullet = require("./bullet")

function Game(){
    this.asteroids = [];
    this.addAsteroids();
    this.ship = new Ship(this.randomPosition(), this);
    // this.all = this.allObjects()
    this.bullets = [];
}

Game.DIM_X = 600;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 20;

Game.prototype.addAsteroids = function addAsteroids(){
    for (let i = 0; i < Game.NUM_ASTEROIDS; i ++){
        let asteroid = new Asteroid(this.randomPosition(),this);
        this.asteroids.push(asteroid);
    }
}

Game.prototype.randomPosition = function randomPosition(){
    return [
        Math.floor(Math.random() * Game.DIM_X), 
        Math.floor(Math.random() * Game.DIM_Y)
    ];
}

Game.prototype.draw = function(ctx){
   
    ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y);

    for (let i = 0 ; i < this.allObjects().length ; i ++){
        this.allObjects()[i].draw(ctx);
    }
}



Game.prototype.moveObjects = function moveObjects(){
    this.allObjects().forEach(object => {
        object.move();
    });
}

Game.prototype.wrap = function wrap(pos){
    let x = pos[0] % Game.DIM_X ;
    let y = pos[1] % Game.DIM_Y ;
    if (x < 0){
        x = Game.DIM_X + x
    }
    if (y < 0){
        y = Game.DIM_Y + y
    }
    return [x,y]; 
}

Game.prototype.checkCollisions = function checkCollisions(){
    for (let i = 0 ; i < this.allObjects().length ; i ++) {
        for (let j = i +1; j < this.allObjects().length ; j ++ ){
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){
                this.allObjects()[i].collideWith(this.allObjects()[j]);
            }
        }
    }
}

Game.prototype.step = function step(){
    this.moveObjects();
    this.checkCollisions();

}

Game.prototype.remove = function remove(object){
    if (object instanceof Asteroid) {
        this.asteroids.splice(this.asteroids.indexOf(object),1)
    } else if (object instanceof Bullet) {
        this.bullets.splice(this.bullets.indexOf(object),1)
    }

}

Game.prototype.allObjects = function allObjects() {
    return this.asteroids.concat(this.bullets,[this.ship])
}

Game.prototype.add = function add(object){
    if (object instanceof Asteroid){
        this.asteroids.push(object)
    }else if (object instanceof Bullet ){
        this.bullets.push(object);
    }
}

Game.prototype.isOutOfBounds = function(pos) {
    if (pos[0] < 0 || pos[0] > Game.DIM_X || pos[1] < 0 || pos[1] > Game.DIM_Y){
        return true;
    }
    return false;
}
module.exports = Game; 

// game = new Game();
// console.log (game.randomPosition())