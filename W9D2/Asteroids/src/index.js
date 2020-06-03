const MovingObject = require("./moving_object.js");
const Util = require("./utils");
const Asteroid = require("./asteroid")
const GameView = require("./game_view.js")
const Game = require("./game.js")
const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

gameview = new GameView(new Game, ctx);
window.MovingObject = MovingObject; 
window.Asteroid = Asteroid;
window.addEventListener("DOMContentLoaded", gameview.start.bind(gameview));
