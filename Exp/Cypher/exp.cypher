// 构建图
CREATE (Alice:Person {name: 'Alice'})-[:KNOWS]->(Bob:Person {name: 'Bob'})
CREATE (Bob)-[:KNOWS]->(Charlie:Person {name: 'Charlie'})
CREATE (Alice)-[:WORKS_WITH]->(Eve:Person {name: 'Eve'})

// 子图匹配查询
MATCH path = (person:Person)-[:KNOWS]->(friend)
WHERE person.name = 'Alice'
RETURN path;