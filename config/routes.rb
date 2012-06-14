Spree::Core::Engine.routes.draw do
  namespace :api do
    scope :module => :v1 do
     match 'database/export' => "database#export"
    end
  end
end
