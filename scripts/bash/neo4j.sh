mkdir -p ~/tmp/neo4j
docker run --name neo -p 7474:7474 -p 7687:7687 -v $HOME/tmp/neo4j:/data -d neo4j
