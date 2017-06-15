Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get   "/calculator/" => "calculator#index"
  post  "/calculator/calculate"
  get "/calculator/calculate" => "calculator#index"
  root  "calculator#index"
end
