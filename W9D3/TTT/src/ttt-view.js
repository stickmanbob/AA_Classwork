class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click',event => {

      const $square = $(event.target);
      try{
        this.game.playMove($square.data('position'));
        $square.html(this.game.currentPlayer);
        $square.addClass('selected')  
      } catch(err) {
        alert(err.message);
      }
      if (this.game.winner()){
        alert('Congrats, you win!')
      }else if (this.game.isOver()) {
        alert('Draw!')
      }
    })
  }

  makeMove($square) {}

  setupBoard() {
    let $ul = $('<ul></ul>');
    $ul.addClass('grid-class');
    this.$el.append($ul);
      for(let row = 0; row < 3; row++){
        for(let col = 0; col < 3; col ++){
          let $li = $('<li></li>');
          $li.addClass('square')
          $li.data('position', [row,col])
          $ul.append($li)
        }
      }
     

  }
}

module.exports = View;
