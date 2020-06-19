import React from 'react'
import { Link } from "react-router-dom";


const PokemonIndexItem = function(props) {
    return (
        <li>
            <Link to= {`/pokemon/${props.pokemon.id}`}>
                <div>{props.pokemon.name}</div>
                <img src={props.pokemon.imageUrl} />
            </Link>
        </li>
    )
}

export default PokemonIndexItem;