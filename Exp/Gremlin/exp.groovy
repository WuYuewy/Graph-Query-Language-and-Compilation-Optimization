// 构建图
g.addV('Person').property('name', 'Alice').as('alice').
  addV('Person').property('name', 'Bob').as('bob').
  addV('Person').property('name', 'Charlie').as('charlie').
  addV('Person').property('name', 'Eve').as('eve').
  addE('KNOWS').from('alice').to('bob').
  addE('KNOWS').from('bob').to('charlie').
  addE('WORKS_WITH').from('alice').to('eve').iterate()

// 图匹配查询
g.V().has('Person', 'name', 'Alice').out('KNOWS').as('friend').select('friend', 'Person')