const MovingObject = require("./moving_object");
const Util = require("./utils");
function Bullet(vel, game) {
    let vel1 = [vel[0]*2 , vel[1]*2]
    options = {color: Bullet.COLOR, radius: Bullet.RADIUS, vel: vel1, pos: game.ship.pos, game: game }
    MovingObject.call(this,options);
    this.isWrappable = false; 
}

Util.inherits(Bullet,MovingObject);


Bullet.COLOR = "black";
Bullet.RADIUS = 10;
module.exports = Bullet;