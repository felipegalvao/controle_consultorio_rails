Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'dashboard' => 'static_pages#dashboard'
  
  resources :users do
    resources :pacientes do
      resources :atendimentos
    end
    resources :financeiros
  end
  
  # Routes para usuários e login
  # -------------------------------------------------------------------- #
  get 'criarconta'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # -------------------------------------------------------------------- #
  
  # Routes relativos a gestão de pacientes
  # -------------------------------------------------------------------- #
  get 'dashboard/pacientes', to: 'pacientes#index', as: 'pacientes'
  get 'dashboard/pacientes/novo' => 'pacientes#new', as: 'novo_paciente'
  get 'dashboard/pacientes/:paciente_id', to: 'pacientes#show', as: 'paciente'
  get 'dashboard/pacientes/:paciente_id/editar', to: 'pacientes#edit', as: 'editar_paciente'
  post 'dashboard/pacientes' => 'pacientes#create'
  patch 'dashboard/pacientes/:paciente_id' => 'pacientes#update'
  delete 'dashboard/pacientes/:paciente_id' => 'pacientes#destroy'
  # -------------------------------------------------------------------- #
  
  # Routes para os atendimentos
  # -------------------------------------------------------------------- #
  get 'dashboard/pacientes/:paciente_id/atendimentos/novo', to: 'atendimentos#new', as: 'novo_atendimento'
  get 'dashboard/pacientes/:paciente_id/atendimentos/:atendimento_id', to: 'atendimentos#show', as: 'atendimento'
  get 'dashboard/pacientes/:paciente_id/atendimentos/' => 'atendimentos#index', as: 'atendimentos'
  get 'dashboard/pacientes/:paciente_id/atendimentos/:atendimento_id/editar', to: 'atendimentos#edit', as: 'editar_atendimento'
  post 'dashboard/pacientes/:paciente_id/atendimentos' => 'atendimentos#create'
  patch 'dashboard/pacientes/:paciente_id/atendimentos/:atendimento_id/editar' => 'atendimentos#update'
  # -------------------------------------------------------------------- #
  
  # Routes para Financeiro
  # -------------------------------------------------------------------- #
  get 'dashboard/financeiro', to: 'financeiros#index', as: 'financeiros'
  get 'dashboard/financeiro/novo' => 'financeiros#new', as: 'novo_financeiro'
  get 'dashboard/financeiro/:financeiro_id', to: 'financeiros#show', as: 'financeiro'
  get 'dashboard/financeiro/:financeiro_id/editar', to: 'financeiros#edit', as: 'editar_financeiro'
  post 'dashboard/financeiro' => 'financeiros#create'
  patch 'dashboard/financeiro/:financeiro_id' => 'financeiros#update'
  delete 'dashboard/financeiro/:financeiro_id' => 'financeiros#destroy'
  # -------------------------------------------------------------------- #
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
