const CONSTANT = { 
  PIPE_SIZE: 100,
  PIPE_START: 300,
  PIPE_DIST_BETWEEN: 220,
  SCROLL_SPEED: 3,
  PIPE_WIDTH: 50,
  PIPE_GAP: 150
}

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.pipes = this.fillPipes();
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
    this.movePipes();
    this.drawPipes(ctx);
  };

  randomPipe(x) {
    let pipeHeight = this.dimensions.height - CONSTANT.PIPE_GAP - 50;
    let pos = Math.floor(Math.random() * pipeHeight);
    return {x,pos}
  }

  fillPipes() {
    return [this.randomPipe(CONSTANT.PIPE_START), this.randomPipe(CONSTANT.PIPE_START + CONSTANT.PIPE_DIST_BETWEEN), this.randomPipe(CONSTANT.PIPE_START + CONSTANT.PIPE_DIST_BETWEEN + CONSTANT.PIPE_DIST_BETWEEN) ]
  }

  movePipes() {
    this.pipes.forEach( (pipe) => { 
      // debugger
      pipe.x -= CONSTANT.SCROLL_SPEED
      if (pipe.x < 0) {
        this.pipes.shift();
        this.pipes.push(this.randomPipe(this.pipes[this.pipes.length -1].x + CONSTANT.PIPE_DIST_BETWEEN))
      }
    })

    
  }

  drawPipes(ctx){
    this.pipes.forEach((pipe)=>{
      ctx.fillStyle = "green"
      //top
      ctx.fillRect(pipe.x, 0, CONSTANT.PIPE_WIDTH, pipe.pos)
      
      //bottom 
      ctx.fillRect(pipe.x, pipe.pos + CONSTANT.PIPE_GAP , CONSTANT.PIPE_WIDTH, this.dimensions.height - CONSTANT.PIPE_GAP - pipe.pos)

    });
  }
}

// let a = new Level({width: 640 , height: 640})

// console.log(a.movePipes())