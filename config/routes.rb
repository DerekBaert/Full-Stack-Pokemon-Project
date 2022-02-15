Rails.application.routes.draw do
  get 'pokedex' => 'pokemons#index', as: 'pokedex'
  get 'pokemon/:id' => 'pokemons#show', as: 'pokemon', id: /\d+/

  get 'moves' => 'moves#index', as: 'moves'
  get 'move/:id' => 'moves#show', as: 'move', id: /\d+/

  get 'generations' => 'generations#index', as: 'generations'
  get 'generation/:id' => 'generations#show', as: 'generation', id: /\d+/

  get 'types' => 'types#index', as: 'types'
  get 'type/:id' => 'types#show', as: 'type', id: /\d+/

  root to: "home#index"

  resources :pokemon, only: [:index, :show] do
    collection do
      get "search"
    end
  end
end
