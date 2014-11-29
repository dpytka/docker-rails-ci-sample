## README

Runing tests in docker container

```
docker build -t dpytka/ruby21 .
docker run -P -v `pwd`:/webapp -w /webapp dpytka/ruby21 bundle install && bundle exec rspec spec/*
```
