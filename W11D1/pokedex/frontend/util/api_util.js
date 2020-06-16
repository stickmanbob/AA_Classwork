export const fetchAllPokemon = function() {
    $.ajax({
        url:'/api/pokemon',
        method: 'GET'
    })
}

