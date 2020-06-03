function GameView(game, ctx) {
    this.game = game;
    this.ctx = ctx;
};

GameView.prototype.start = function start() {
    setInterval(this.game.step.bind(this.game), 20);
    // debugger 
    setInterval(this.game.draw.bind(this.game), 20, this.ctx);
    this.bindKeyHandlers();
console.log("started!!")
};

GameView.prototype.bindKeyHandlers = function bindKeyHandlers() {
    key("up", () => {this.game.ship.power([0,-5])});
    key("down", () => { this.game.ship.power([0, 5]) });
    key("right", () => { this.game.ship.power([5, 0]) });
    key("left", () => { this.game.ship.power([-5, 0]) });
    key("space", () => { this.game.ship.fireBullet() });
    
}

module.exports = GameView;