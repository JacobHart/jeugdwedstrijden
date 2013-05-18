# ik denk dat ik de roeiers maar moet verwijderen
# admin: toevoegen clubs en de rest   admin2: resultaten en heats wijzigen.
# !! uitkijken dat navbar niet op elkaar stapeld dan is de helft niet te zien
# Controleren of alles is gedefineerd  zoals results die later showen in heats pagina!

# Ik wil voor iedreen:
# team (index show) Rowers (index show) Clubs (index en show) Boattypes (catogory)(index en show)heats(index (show??))results in boatttypes

# opmaak:
# responsive
# alle links controleren, sterkte!
# heats/show opmaak bij verschillende grote boten.. viertje tegen tweetje?

# liefste hele regel results versturen!   naja bij extra tijd!

# extra:
# Boatid nog vaker vermelden! rowers page bijv!
# bij rowers worden de teams anders weergegeven dan  rowers op de team pagina   wat is mooier?
# alle rowers en teams (vooral op club pagina?) klikbaar maken
# heel veel later rower/show persoonlijke pagina met club resultaten   alleen na inloggen toegankelijk..
# sites en adressen bij club
# kijken wat weg kan bij responsive

# Moet nog:
# Also club/edit  rowerslists and rowers e.d. editten!
# invoeren boten, boat_ids e.d.apparte pagina admin
#2 Nieuwe invoer gegevens op admin pagina? of bij clubs new
#  bij versturen forms in algemeen goed doorlinken!
# string in floats veranderen en dan migrate opnieuw runnen (makkelijker invoeren op iphone)
#4 team/show    results   en alles
#3 team show maken!
# Later bootjes nog boat_type geven!
#5 rower show => results!
#!!!!!!! club show gesorteerd op heat, gaat nu toevallig goed
# validates

# notices maken! login, warning zoals onder, problemen  drama en verdriet.
# !!! Al gedaan bij results   tabel omschrijven in notice! <= Bij heats edit en results en heats index waarschuuwing boven aan net als boattypes.
#!!!!! wat te doen bij did not fisish   weghalen of maximale straf geven    hoe noteren bij weghalen
# weghalen en waarschuwen dat opnieuw ingedeeld moet worden. In waarschuwing ook voorstellen maximale tijdstraf te geven.
# wel link naar teams houden voor als er iets opgezocht moet worden, rowers zijn minder belangrijk.. Maar wel leuk anders doe ik er niets mee.. Of op club pagina wel!

# Controleren
# controleren of je club.id hebt omgeschreven in .name

# Notitie
# Gekozen geen lanes... Wil dat alle boten zo dicht mogelijk bij de kant varen. geen lege plekken.
ZzvJeugdwedstrijden::Application.routes.draw do

  root to: 'sessions#new'

  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create', as: 'sessions'
  delete '/sessions' => 'sessions#destroy'


  # Routes for the Admin resource:
  # CREATE
  get '/admins/new', controller: 'admins', action: 'new', as: 'new_admin'
  post '/admins', controller: 'admins', action: 'create'

  # READ
  get '/admins', controller: 'admins', action: 'index', as: 'admins'
  get '/admins/:id', controller: 'admins', action: 'show', as: 'admin'

  # UPDATE
  get '/admins/:id/edit', controller: 'admins', action: 'edit', as: 'edit_admin'
  put '/admins/:id', controller: 'admins', action: 'update'

  # DELETE
  delete '/admins/:id', controller: 'admins', action: 'destroy'
  #------------------------------

  # Routes for the Team_classification resource:
  # CREATE
  get '/team_classifications/new', controller: 'team_classifications', action: 'new', as: 'new_team_classification'
  post '/team_classifications', controller: 'team_classifications', action: 'create'

  # READ
  get '/team_classifications', controller: 'team_classifications', action: 'index', as: 'team_classifications'
  get '/team_classifications/:id', controller: 'team_classifications', action: 'show', as: 'team_classification'

  # UPDATE
  get '/team_classifications/:id/edit', controller: 'team_classifications', action: 'edit', as: 'edit_team_classification'
  put '/team_classifications/:id', controller: 'team_classifications', action: 'update'

  # DELETE
  delete '/team_classifications/:id', controller: 'team_classifications', action: 'destroy'
  #------------------------------

  # Routes for the Result resource:
  # CREATE
  get '/results/new', controller: 'results', action: 'new', as: 'new_result'
  post '/results', controller: 'results', action: 'create'

  # READ
  get '/results', controller: 'results', action: 'index', as: 'results'
  get '/results/:id', controller: 'results', action: 'show', as: 'result'

  # UPDATE
  get '/results/:id/edit', controller: 'results', action: 'edit', as: 'edit_result'
  put '/results/:id', controller: 'results', action: 'update'

  # DELETE
  delete '/results/:id', controller: 'results', action: 'destroy'
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get '/teams/new', controller: 'teams', action: 'new', as: 'new_team'
  post '/teams', controller: 'teams', action: 'create'

  # READ
  get '/teams', controller: 'teams', action: 'index', as: 'teams'
  get '/teams/:id', controller: 'teams', action: 'show', as: 'team'

  # UPDATE
  get '/teams/:id/edit', controller: 'teams', action: 'edit', as: 'edit_team'
  put '/teams/:id', controller: 'teams', action: 'update'

  # DELETE
  delete '/teams/:id', controller: 'teams', action: 'destroy'

  #------------------------------

  # Routes for the Rower_classification resource:
  # CREATE
  get '/rower_classifications/new', controller: 'rower_classifications', action: 'new', as: 'new_rower_classification'
  post '/rower_classifications', controller: 'rower_classifications', action: 'create'

  # READ
  get '/rower_classifications', controller: 'rower_classifications', action: 'index', as: 'rower_classifications'
  get '/rower_classifications/:id', controller: 'rower_classifications', action: 'show', as: 'rower_classification'

  # UPDATE
  get '/rower_classifications/:id/edit', controller: 'rower_classifications', action: 'edit', as: 'edit_rower_classification'
  put '/rower_classifications/:id', controller: 'rower_classifications', action: 'update'

  # DELETE
  delete '/rower_classifications/:id', controller: 'rower_classifications', action: 'destroy'
  #------------------------------

  # Routes for the Rower resource:
  # CREATE
  get '/rowers/new', controller: 'rowers', action: 'new', as: 'new_rower'
  post '/rowers', controller: 'rowers', action: 'create'

  # READ
  get '/rowers', controller: 'rowers', action: 'index', as: 'rowers'
  get '/rowers/:id', controller: 'rowers', action: 'show', as: 'rower'

  # UPDATE
  get '/rowers/:id/edit', controller: 'rowers', action: 'edit', as: 'edit_rower'
  put '/rowers/:id', controller: 'rowers', action: 'update'

  # DELETE
  delete '/rowers/:id', controller: 'rowers', action: 'destroy'
  #------------------------------

  # Routes for the Heat resource:
  # CREATE
  get '/heats/new', controller: 'heats', action: 'new', as: 'new_heat'
  post '/heats', controller: 'heats', action: 'create'

  # READ
  get '/heats', controller: 'heats', action: 'index', as: 'heats'
  get '/heats/:id', controller: 'heats', action: 'show', as: 'heat'

  # UPDATE
  get '/heats/:id/edit', controller: 'heats', action: 'edit', as: 'edit_heat'
  put '/heats/:id', controller: 'heats', action: 'update'

  # DELETE
  delete '/heats/:id', controller: 'heats', action: 'destroy'
  #------------------------------

  # Routes for the Club resource:
  # CREATE
  get '/clubs/new', controller: 'clubs', action: 'new', as: 'new_club'
  post '/clubs', controller: 'clubs', action: 'create'

  # READ
  get '/clubs', controller: 'clubs', action: 'index', as: 'clubs'
  get '/clubs/:id', controller: 'clubs', action: 'show', as: 'club'

  # UPDATE
  get '/clubs/:id/edit', controller: 'clubs', action: 'edit', as: 'edit_club'
  put '/clubs/:id', controller: 'clubs', action: 'update'

  # DELETE
  delete '/clubs/:id', controller: 'clubs', action: 'destroy'
  #------------------------------

  # Routes for the Boat_type resource:
  # CREATE
  get '/boat_types/new', controller: 'boat_types', action: 'new', as: 'new_boat_type'
  post '/boat_types', controller: 'boat_types', action: 'create'

  # READ
  get '/boat_types', controller: 'boat_types', action: 'index', as: 'boat_types'
  get '/boat_types/:id', controller: 'boat_types', action: 'show', as: 'boat_type'

  # UPDATE
  get '/boat_types/:id/edit', controller: 'boat_types', action: 'edit', as: 'edit_boat_type'
  put '/boat_types/:id', controller: 'boat_types', action: 'update'

  # DELETE
  delete '/boat_types/:id', controller: 'boat_types', action: 'destroy'

  # Calculate Rankings
  get '/boat_types/:id/calculaterank', controller: 'boat_types', action: 'calculaterank', as: 'calculaterank'
  #------------------------------

  # Routes for the Boat resource:
  # CREATE
  get '/boats/new', controller: 'boats', action: 'new', as: 'new_boat'
  post '/boats', controller: 'boats', action: 'create'

  # READ
  get '/boats', controller: 'boats', action: 'index', as: 'boats'
  get '/boats/:id', controller: 'boats', action: 'show', as: 'boat'

  # UPDATE
  get '/boats/:id/edit', controller: 'boats', action: 'edit', as: 'edit_boat'
  put '/boats/:id', controller: 'boats', action: 'update'

  # DELETE
  delete '/boats/:id', controller: 'boats', action: 'destroy'
  #------------------------------

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
