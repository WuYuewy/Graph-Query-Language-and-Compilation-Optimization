// 创建图数据
g.addV('Actor').property('name', 'Tom Hanks').property('birthYear', 1956).as('tom')
  .addV('Actor').property('name', 'Julia Roberts').property('birthYear', 1967).as('julia')
  .addV('Director').property('name', 'Steven Spielberg').property('birthYear', 1946).as('spielberg')
  .addV('Director').property('name', 'Christopher Nolan').property('birthYear', 1970).as('nolan')
  .addV('Movie').property('title', 'Forrest Gump').property('year', 1994).as('forrestGump')
  .addV('Movie').property('title', 'Inception').property('year', 2010).as('inception')
  .addE('ACTED_IN').from('tom').to('forrestGump')
  .addE('ACTED_IN').from('tom').to('inception')
  .addE('DIRECTED').from('spielberg').to('forrestGump')
  .addE('DIRECTED').from('nolan').to('inception')
  .next()

// 执行查询
g.V().has('Actor', 'name', 'Tom Hanks').out('ACTED_IN').as('movie')
  .out('DIRECTED').as('director')
  .select('movie', 'director').by(valueMap()).toList()
