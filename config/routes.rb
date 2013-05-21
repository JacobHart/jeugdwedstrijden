# NOTITIES
# !!!!!!Team show bewaren voor admin!
# Results/edit    layout table weggehaald ivm alert msgss die anders lelijk worden! (dit niet perongelukt terug veranderen)

# Opties voor later
# Of (club) overal weghalen en naam van team ZZV2 maken of overal teams vermelden (ook bij heats)

# Nu
# JUST DO IT! Boattype category noemen!! DAT IS EEN BITCH EERST NIEUWE GENEREREN DAN OUDE VERWIJDEREN :(
# string in floats veranderen en dan migrate opnieuw runnen (makkelijker invoeren op iphone)
# validations
# notices maken! login, warning zoals onder, problemen  drama en verdriet. Custom validations lantern lesson!
# Je gaat nu edit pagina's hergebruiken dus wel opmaken! dropdown menu's e.d.
# Routes opruimen en controlers en links en navbar herstellen. Echt nadenken over urls ZOals 1/edit voor heats?! Dat is gek!!!
# error messegaes is anders dan notice en alert, kijken! lantern lesson custom validation!
# Hippere realisticer seedfile met ZZV1 ipv team1
# !!! Velden mogen niet leeg zijn, creeerde net 20 boten :)

# Controle:
# Gaan alle lastige dingen zoals results op alle (inclusief team) paginas goed?
# results 1.20 + 2.0 is soms 3.21111111
# Gaat rank uitrekenen bij meerdere heats netjes?
# alle links controleren, sterkte!
# controleren of je club.id hebt omgeschreven in .name
# Wat ik  et mentor heb gedaan op club edit pagina met blank?
# alle destroy warning msges wel netjes?

# Wat niet hoeft
# Bij maken team   aantal rowers afhankelijk van type is nog een uitdaging (hoeft niet)
# Bij een lege laptime wordt het team automatisch eerste! IDEAAAL :(   (kan je niks aan doen)
# admin: toevoegen clubs en de rest   admin2: resultaten en heats wijzigen.
# Als laatste clubs/edit veranderen! (of wel goed zo? wel meer vrijheid voor admin!)
#!!!VRAGEN!!! invoeren boten, boat_ids e.d.apparte pagina admin (lastig met keuze menu!)(params verstuurd welke geedit moet worden, piece of cake!)

# Later
# !! uitkijken dat navbar niet op elkaar stapeld dan is de helft niet te zien
# Controleren of alles is gedefineerd  zoals results die later showen in heats pagina!

# opmaak:
# responsive













ZzvJeugdwedstrijden::Application.routes.draw do

  # Routes for about:
  root :to => 'about#index'
  get '/about', controller: 'about', action: 'index', as: 'about'

  # Routes for sessions:
  post '/sessions' => 'sessions#create', as: 'sessions'
  delete '/sessions' => 'sessions#destroy'

  # Routes for the Admin resource:
  # CREATE
  get '/admins/new', controller: 'admins', action: 'new', as: 'new_admin'

  #------------------------------

  # Routes for the Team_classification resource:
  # CREATE
  post '/team_classifications', controller: 'team_classifications', action: 'create'

  put '/team_classifications/:id', controller: 'team_classifications', action: 'update'

  delete '/team_classifications/:id', controller: 'team_classifications', action: 'destroy'
  #------------------------------

  # Routes for the Result resource:
  # CREATE
  get '/results/new', controller: 'results', action: 'new', as: 'new_result'
  post '/results', controller: 'results', action: 'create'

  # UPDATE
  get '/results/:id/edit', controller: 'results', action: 'edit', as: 'edit_result'
  put '/results/:id', controller: 'results', action: 'update'

  # DELETE
  delete '/results/:id', controller: 'results', action: 'destroy'
  #------------------------------

  # Routes for the Team resource:
  # CREATE
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
  post '/rower_classifications', controller: 'rower_classifications', action: 'create'

  put '/rower_classifications/:id', controller: 'rower_classifications', action: 'update'

  delete '/rower_classifications/:id', controller: 'rower_classifications', action: 'destroy'
  #------------------------------

  # Routes for the Rower resource:
  # CREATE
  post '/rowers', controller: 'rowers', action: 'create'

  # READ
  get '/rowers', controller: 'rowers', action: 'index', as: 'rowers'

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

  # Teams & Rowers
  get '/clubs/:id/teams', controller: 'clubs', action: 'teams', as: 'club_teams'
  get '/clubs/:id/rowers', controller: 'clubs', action: 'rowers', as: 'club_rowers'

  # CREATE
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
  post '/boats', controller: 'boats', action: 'create'

  # READ
  get '/boats', controller: 'boats', action: 'index', as: 'boats'

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
