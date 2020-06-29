# == Route Map
#
#                Prefix Verb   URI Pattern                                         Controller#Action
#      building_offices GET    /buildings/:building_id/offices(.:format)           offices#index
#                       POST   /buildings/:building_id/offices(.:format)           offices#create
#  edit_building_office GET    /buildings/:building_id/offices/:id/edit(.:format)  offices#edit
#       building_office GET    /buildings/:building_id/offices/:id(.:format)       offices#show
#             buildings GET    /buildings(.:format)                                buildings#index
#                       POST   /buildings(.:format)                                buildings#create
#          new_building GET    /buildings/new(.:format)                            buildings#new
#         edit_building GET    /buildings/:id/edit(.:format)                       buildings#edit
#              building GET    /buildings/:id(.:format)                            buildings#show
#                       PATCH  /buildings/:id(.:format)                            buildings#update
#                       PUT    /buildings/:id(.:format)                            buildings#update
#     company_employees GET    /companies/:company_id/employees(.:format)          employees#index
#                       POST   /companies/:company_id/employees(.:format)          employees#create
#  new_company_employee GET    /companies/:company_id/employees/new(.:format)      employees#new
# edit_company_employee GET    /companies/:company_id/employees/:id/edit(.:format) employees#edit
#      company_employee GET    /companies/:company_id/employees/:id(.:format)      employees#show
#                       PATCH  /companies/:company_id/employees/:id(.:format)      employees#update
#                       PUT    /companies/:company_id/employees/:id(.:format)      employees#update
#                       DELETE /companies/:company_id/employees/:id(.:format)      employees#destroy
#             companies GET    /companies(.:format)                                companies#index
#                       POST   /companies(.:format)                                companies#create
#           new_company GET    /companies/new(.:format)                            companies#new
#          edit_company GET    /companies/:id/edit(.:format)                       companies#edit
#               company GET    /companies/:id(.:format)                            companies#show
#                       PATCH  /companies/:id(.:format)                            companies#update
#                       PUT    /companies/:id(.:format)                            companies#update
#                       DELETE /companies/:id(.:format)                            companies#destroy
#                office GET    /offices/:id(.:format)                              offices#show

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buildings, except: [:destroy] do
     resources :offices, only: [:index, :edit, :create, :show]
  end
  resources :companies do
    resources :employees
  end


end
