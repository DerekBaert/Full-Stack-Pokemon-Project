Rails.application.routes.draw do
  get 'pokedex' => 'pokemons#index', as: 'pokedex'
  get 'pokemon/:id' => 'pokemons#show', as: 'pokemon', id: /\d+/

end
