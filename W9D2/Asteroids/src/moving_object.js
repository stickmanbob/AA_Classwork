function MovingObject(options){
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
};

MovingObject.prototype.isWrappable = true;

MovingObject.prototype.draw = function draw(ctx){
    ctx.fillStyle = this.color
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
    ctx.closePath();
    ctx.fill();
};

MovingObject.prototype.move = function move(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    if (this.isWrappable){
        this.pos = this.game.wrap(this.pos);
    } else if (this.game.isOutOfBounds(this.pos)) {
        this.game.remove(this);        
    }

};
// Dist = Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
// Norm([x_1, y_1]) = Dist([0, 0], [x_1, y_1])
MovingObject.prototype.isCollidedWith = function isCollidedWith(otherObject){
    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0])**2 + (this.pos[1] - otherObject.pos[1])**2)
    let radiusSum = this.radius + otherObject.radius;
    return distance < radiusSum; 
};

MovingObject.prototype.collideWith = function collideWith(otherObject) {
    
    
}
module.exports = MovingObject;