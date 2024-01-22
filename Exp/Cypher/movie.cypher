// 创建演员节点
CREATE (:Actor {name: 'Tom Hanks', birth_year: 1956})
CREATE (:Actor {name: 'Julia Roberts', birth_year: 1967})

// 创建导演节点
CREATE (:Director {name: 'Steven Spielberg', birth_year: 1946})
CREATE (:Director {name: 'Christopher Nolan', birth_year: 1970})

// 创建电影节点
CREATE (:Movie {title: 'Forrest Gump', year: 1994})
CREATE (:Movie {title: 'Inception', year: 2010})

// 建立关系
MATCH (tom:Actor {name: 'Tom Hanks'}), (julia:Actor {name: 'Julia Roberts'}),
      (spielberg:Director {name: 'Steven Spielberg'}), (nolan:Director {name: 'Christopher Nolan'}),
      (forrestGump:Movie {title: 'Forrest Gump'}), (inception:Movie {title: 'Inception'})
CREATE
  (tom)-[:ACTED_IN]->(forrestGump),
  (julia)-[:ACTED_IN]->(forrestGump),
  (spielberg)-[:DIRECTED]->(forrestGump),
  (tom)-[:ACTED_IN]->(inception),
  (nolan)-[:DIRECTED]->(inception)


MATCH (actor:Actor {name: 'Tom Hanks'})-[:ACTED_IN]->(movie)-[:DIRECTED]->(director:Director {name: 'Steven Spielberg'})
RETURN actor, movie, director
