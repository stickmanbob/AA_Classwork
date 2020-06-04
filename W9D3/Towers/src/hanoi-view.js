
class View {
    constructor(game,$el){
        this.game = game;
        this.$el = $el;
        this.setupTowers();
        this.render();
    };

    setupTowers(){
       

        for (let toweridx = 0; toweridx< 3; toweridx++){
            let $tower = $('<ul></ul>');
            $tower.addClass('tower');
            $tower.data('number', toweridx);
            this.$el.append($tower);
            for (let discidx = 0; discidx < 3; discidx++){
                let $disc = $('<li></li>')
                $disc.attr('pos', `[${toweridx}, ${discidx}]`)
                // if (toweridx === 0){
                //     $disc.addClass(`disc-${discidx}`);
                // }
                $tower.append($disc)
            }
        }
    };

    render(){
        // this.game.towers
        // for i 
        //     for j 
        //         if this.game.towers[i][j] = val 
        //             let pos = [i, j]
        //          li = $el.find(`[data='${pos}']`)
        //             li.addClass(val)

        for (let i =0; i < 3; i++){
            for (let j=0; j<3; j++){
                let val = this.game.towers[i][j];
                if (val){
                   let li =  this.$el.find(`[pos= ${[i,j]}]`)
                   $(li).addClass(`disc-${val}`)
                }
                
            }
        }


                

       
       
    }
}

module.exports = View;