const Util = require("./utils.js")
const Bullet = require("./bullet.js")
const MovingObject = require("./moving_object.js")
function Ship(pos,game){
    let options = { color: Ship.COLOR, radius: Ship.RADIUS, vel: [0,0], pos: pos, game: game } 
    MovingObject.call(this, options)
};
Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function relocate() {
    this.pos = this.game.randomPosition();
    this.vel = [0,0];
    
};

Ship.prototype.power = function power(impulse) {
    this.vel[0] += impulse[0];
    this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function fireBullet(){
    if (this.vel[0] !=0 || this.vel[1] !=0){
        let bullet = new Bullet(this.vel, this.game);
        this.game.add(bullet); 
    }
}


Ship.RADIUS = 20;
Ship.COLOR = "red";

module.exports = Ship;