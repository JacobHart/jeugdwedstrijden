# Nu
# In admin nav goed aangeven waar je club kan toevogen
# Hippere realisticer seedfile met ZZV1 ipv team1. Of (club) overal weghalen en naam van team ZZV2 maken of overal teams vermelden (ook bij heats)
# zondr container mooier! Of, toch niet? Foto toevoegen!

# clubs show kan weg toch!? anders opmaak met page header
# Small text in h1 header weg bij responsive!
# MOEILIJK KAN NOG NIET ROWER CLASSIFICATION UPDATEN!

# moet dit wel???
# string in floats veranderen en dan migrate opnieuw runnen (makkelijker invoeren op iphone)

# Controle:
# validates laat gedaan in modell en niet nagekeken!
# Gaan alle lastige dingen zoals results op alle (inclusief team) paginas goed?
# results 1.20 + 2.0 is soms 3.21111111
# Gaat rank uitrekenen bij meerdere heats netjes?
# alle links controleren, sterkte!
# controleren of je club.id hebt omgeschreven in .name
# Wat ik  et mentor heb gedaan op club edit pagina met blank?
# alle destroy warning msges wel netjes?
# !!! Velden mogen niet leeg zijn, creeerde net 20 boten :)   en sommige unqieness
#  OEf werken alle notices and errors?

# Wat niet hoeft
# Bij maken team   aantal rowers afhankelijk van type is nog een uitdaging (hoeft niet)
# Bij een lege laptime wordt het team automatisch eerste! IDEAAAL :(   (kan je niks aan doen)
# admin: toevoegen clubs en de rest   admin2: resultaten en heats wijzigen.
# Als laatste clubs/edit veranderen! (of wel goed zo? wel meer vrijheid voor admin!)
#!!!VRAGEN!!! invoeren boten, boat_ids e.d.apparte pagina admin (lastig met keuze menu!)(params verstuurd welke geedit moet worden, piece of cake!)
# JUST DO IT! Boattype category noemen!! DAT IS EEN BITCH EERST NIEUWE GENEREREN DAN OUDE VERWIJDEREN :(
# Routes opruimen en controlers en links en navbar herstellen. Echt nadenken over urls ZOals 1/edit voor heats?! Dat is gek!!!

# Later
# !! uitkijken dat navbar niet op elkaar stapeld dan is de helft niet te zien
# Controleren of alles is gedefineerd  zoals results die later showen in heats pagina!
# Wel heel cool een navbar die eerst op site zweeft en later onder main navbar plakt, zie bootswatsch
# opmaak:
# responsive












ZzvJeugdwedstrijden::Application.routes.draw do

  # Routes for about:
  root :to => 'about#index'
  get '/about', controller: 'about', action: 'index', as: 'about'

  # Routes for sessions:
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
  get '/results/edit', controller: 'results', action: 'edit', as: 'edit_result'

  # CREATE
  get '/results/new', controller: 'results', action: 'new', as: 'new_result'
  post '/results', controller: 'results', action: 'create'

  # READ
  get '/results', controller: 'results', action: 'index', as: 'results'
  get '/results/:id', controller: 'results', action: 'show', as: 'result'

  # UPDATE

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

  get '/heats/edit', controller: 'heats', action: 'edit', as: 'edit_heat'


  # CREATE
  get '/heats/new', controller: 'heats', action: 'new', as: 'new_heat'
  post '/heats', controller: 'heats', action: 'create'

  # READ
  get '/heats', controller: 'heats', action: 'index', as: 'heats'
  get '/heats/:id', controller: 'heats', action: 'show', as: 'heat'

  # UPDATE
  put '/heats/:id', controller: 'heats', action: 'update'

  # DELETE
  delete '/heats/:id', controller: 'heats', action: 'destroy'
  #------------------------------
  # Routes for the Club resource:

  # Teams & Rowers
  get '/clubs/:id/teams', controller: 'clubs', action: 'teams', as: 'club_teams'
  get '/clubs/:id/rowers', controller: 'clubs', action: 'rowers', as: 'club_rowers'

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
end
