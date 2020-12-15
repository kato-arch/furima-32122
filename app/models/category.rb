class Category < ActiveHash::Base
  include ActiveHash::Associations
  # カテゴリー
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア' },
    { id: 6, name: '本' },
    { id: 7, name: '家電' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'ハンドメイド' },
    { id: 10, name: 'その他' }
  ]

end
