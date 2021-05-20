class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品・未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れなし' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: 'やや傷や汚れあり' },
    { id: 7, name: '傷や汚れあり' },
    { id: 8, name: '全体的に状態が悪い' },
  ]
  end