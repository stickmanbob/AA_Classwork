const View = require('./ttt-view.js')// require appropriate file
const Game = require('./game.js')// require appropriate file

  $(() => {
    const $el = $('.ttt');
    const game = new Game();
    const view = new View (game, $el)

    // Your code here
  });
