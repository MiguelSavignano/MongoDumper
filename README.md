# MongoDumper
###
###This it's a script in ruby to save only last 7 dumps
###
Edit Your crontab to execute the mongo_dumper.sh every day
```bash
  $ crontab -e
  0 1  *   *   * /home/deploy/dumps/mongo_dumper.sh
