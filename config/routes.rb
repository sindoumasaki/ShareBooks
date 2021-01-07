Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 共通（今回はtopページのみ）===============================
  root "common/tops#top"

  # devise関連、エラー回避のために上に記述====================
  devise_for :admins
  # 採用者閲覧用アカウント編集・削除・パスワード 再設定メールを防止するための記述。
  devise_for :users, controller: {
    registrations: 'users/registrations',
    passwards: 'users/passwards',
  }
  # ワンタッチログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # ゲストログイン(ポートフォリオ閲覧用)
  devise_scope :user do
    post 'users/employer_sign_in', to: 'users/sessions#browsing'
  end

  # user======================================================
  namespace :user do
    resources :books
    resources :favorites, only: %i[index create destroy]
    resources :searches,  only: %i[index]
    get 'users/show'
    get 'homes/home'
    get 'users/my_page'
    get 'users/follower'
    get 'users/follows'
  end

  # admin=====================================================
  namespace :admin do
    resources :genres,    only: %i[index]
    resources :searches,  only: %i[index]
    get 'homes/home'
    get 'users/show'
    get 'users/index'
    get 'users/bad_index'
    get 'users/confirm'
    get 'users/bye_bye'
    get 'books/show'
    get 'books/new_index'
  end

end
