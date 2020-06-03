const MovingObject = require("./moving_object.js");
const Util = require("./utils")
const Ship = require("./ship.js")
const Bullet = require("./bullet")
function Asteroid(pos, game){
    let options = {color: Asteroid.COLOR, radius: Asteroid.RADIUS, vel:  Util.randomVec(Asteroid.LENGTH), pos: pos, game: game } 
    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);
Asteroid.prototype.collideWith = function collideWith(otherObject){
    
    
    if (otherObject instanceof Ship){
        // debugger 
        otherObject.relocate();
    }else if (otherObject instanceof Bullet){
        this.game.remove(this);
        otherObject.game.remove(otherObject);
    }
}
Asteroid.COLOR = "blue";
Asteroid.RADIUS = 20;
Asteroid.LENGTH = 5;

module.exports = Asteroid;