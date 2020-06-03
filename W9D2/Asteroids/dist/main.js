/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\")\nfunction Asteroid(pos, game){\n    let options = {color: Asteroid.COLOR, radius: Asteroid.RADIUS, vel:  Util.randomVec(Asteroid.LENGTH), pos: pos, game: game } \n    MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\nAsteroid.prototype.collideWith = function collideWith(otherObject){\n    \n    \n    if (otherObject instanceof Ship){\n        // debugger \n        otherObject.relocate();\n    }else if (otherObject instanceof Bullet){\n        this.game.remove(this);\n        otherObject.game.remove(otherObject);\n    }\n}\nAsteroid.COLOR = \"blue\";\nAsteroid.RADIUS = 20;\nAsteroid.LENGTH = 5;\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nfunction Bullet(vel, game) {\n    let vel1 = [vel[0]*2 , vel[1]*2]\n    options = {color: Bullet.COLOR, radius: Bullet.RADIUS, vel: vel1, pos: game.ship.pos, game: game }\n    MovingObject.call(this,options);\n    this.isWrappable = false; \n}\n\nUtil.inherits(Bullet,MovingObject);\n\n\nBullet.COLOR = \"black\";\nBullet.RADIUS = 10;\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\")\n\nfunction Game(){\n    this.asteroids = [];\n    this.addAsteroids();\n    this.ship = new Ship(this.randomPosition(), this);\n    // this.all = this.allObjects()\n    this.bullets = [];\n}\n\nGame.DIM_X = 600;\nGame.DIM_Y = 600;\nGame.NUM_ASTEROIDS = 20;\n\nGame.prototype.addAsteroids = function addAsteroids(){\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i ++){\n        let asteroid = new Asteroid(this.randomPosition(),this);\n        this.asteroids.push(asteroid);\n    }\n}\n\nGame.prototype.randomPosition = function randomPosition(){\n    return [\n        Math.floor(Math.random() * Game.DIM_X), \n        Math.floor(Math.random() * Game.DIM_Y)\n    ];\n}\n\nGame.prototype.draw = function(ctx){\n   \n    ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y);\n\n    for (let i = 0 ; i < this.allObjects().length ; i ++){\n        this.allObjects()[i].draw(ctx);\n    }\n}\n\n\n\nGame.prototype.moveObjects = function moveObjects(){\n    this.allObjects().forEach(object => {\n        object.move();\n    });\n}\n\nGame.prototype.wrap = function wrap(pos){\n    let x = pos[0] % Game.DIM_X ;\n    let y = pos[1] % Game.DIM_Y ;\n    if (x < 0){\n        x = Game.DIM_X + x\n    }\n    if (y < 0){\n        y = Game.DIM_Y + y\n    }\n    return [x,y]; \n}\n\nGame.prototype.checkCollisions = function checkCollisions(){\n    for (let i = 0 ; i < this.allObjects().length ; i ++) {\n        for (let j = i +1; j < this.allObjects().length ; j ++ ){\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){\n                this.allObjects()[i].collideWith(this.allObjects()[j]);\n            }\n        }\n    }\n}\n\nGame.prototype.step = function step(){\n    this.moveObjects();\n    this.checkCollisions();\n\n}\n\nGame.prototype.remove = function remove(object){\n    if (object instanceof Asteroid) {\n        this.asteroids.splice(this.asteroids.indexOf(object),1)\n    } else if (object instanceof Bullet) {\n        this.bullets.splice(this.bullets.indexOf(object),1)\n    }\n\n}\n\nGame.prototype.allObjects = function allObjects() {\n    return this.asteroids.concat(this.bullets,[this.ship])\n}\n\nGame.prototype.add = function add(object){\n    if (object instanceof Asteroid){\n        this.asteroids.push(object)\n    }else if (object instanceof Bullet ){\n        this.bullets.push(object);\n    }\n}\n\nGame.prototype.isOutOfBounds = function(pos) {\n    if (pos[0] < 0 || pos[0] > Game.DIM_X || pos[1] < 0 || pos[1] > Game.DIM_Y){\n        return true;\n    }\n    return false;\n}\nmodule.exports = Game; \n\n// game = new Game();\n// console.log (game.randomPosition())\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function GameView(game, ctx) {\n    this.game = game;\n    this.ctx = ctx;\n};\n\nGameView.prototype.start = function start() {\n    setInterval(this.game.step.bind(this.game), 20);\n    // debugger \n    setInterval(this.game.draw.bind(this.game), 20, this.ctx);\n    this.bindKeyHandlers();\nconsole.log(\"started!!\")\n};\n\nGameView.prototype.bindKeyHandlers = function bindKeyHandlers() {\n    key(\"up\", () => {this.game.ship.power([0,-5])});\n    key(\"down\", () => { this.game.ship.power([0, 5]) });\n    key(\"right\", () => { this.game.ship.power([5, 0]) });\n    key(\"left\", () => { this.game.ship.power([-5, 0]) });\n    key(\"space\", () => { this.game.ship.fireBullet() });\n    \n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst canvas = document.getElementById(\"game-canvas\");\nconst ctx = canvas.getContext(\"2d\");\n\ngameview = new GameView(new Game, ctx);\nwindow.MovingObject = MovingObject; \nwindow.Asteroid = Asteroid;\nwindow.addEventListener(\"DOMContentLoaded\", gameview.start.bind(gameview));\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options){\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = options.game;\n};\n\nMovingObject.prototype.isWrappable = true;\n\nMovingObject.prototype.draw = function draw(ctx){\n    ctx.fillStyle = this.color\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);\n    ctx.closePath();\n    ctx.fill();\n};\n\nMovingObject.prototype.move = function move(){\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    if (this.isWrappable){\n        this.pos = this.game.wrap(this.pos);\n    } else if (this.game.isOutOfBounds(this.pos)) {\n        this.game.remove(this);        \n    }\n\n};\n// Dist = Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n// Norm([x_1, y_1]) = Dist([0, 0], [x_1, y_1])\nMovingObject.prototype.isCollidedWith = function isCollidedWith(otherObject){\n    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0])**2 + (this.pos[1] - otherObject.pos[1])**2)\n    let radiusSum = this.radius + otherObject.radius;\n    return distance < radiusSum; \n};\n\nMovingObject.prototype.collideWith = function collideWith(otherObject) {\n    \n    \n}\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nfunction Ship(pos,game){\n    let options = { color: Ship.COLOR, radius: Ship.RADIUS, vel: [0,0], pos: pos, game: game } \n    MovingObject.call(this, options)\n};\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function relocate() {\n    this.pos = this.game.randomPosition();\n    this.vel = [0,0];\n    \n};\n\nShip.prototype.power = function power(impulse) {\n    this.vel[0] += impulse[0];\n    this.vel[1] += impulse[1];\n}\n\nShip.prototype.fireBullet = function fireBullet(){\n    if (this.vel[0] !=0 || this.vel[1] !=0){\n        let bullet = new Bullet(this.vel, this.game);\n        this.game.add(bullet); \n    }\n}\n\n\nShip.RADIUS = 20;\nShip.COLOR = \"red\";\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = { \n    inherits(childClass, parentClass){\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util; \n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });