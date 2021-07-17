#!/usr/bin/env bash

# Write elasticache challenge parameters to Parameter Store
# Original script by Garry Stafford:
# https://github.com/garystafford/aws-rds-postgres/blob/4571d7a1f48b0cd2c8c866e7f9c3baebde3de158/parameter_store_values.sh

# Put parameters into Parameter Store
aws ssm put-parameter \
  --name /elasticache_challenge/db_name \
  --type String \
  --value "ChallengeDB" \
  --description "Database name" \
  --overwrite

aws ssm put-parameter \
  --name /elasticache_challenge/master_username \
  --type String \
  --value "masteruser" \
  --description "Master Username for database" \
  --overwrite

aws ssm put-parameter \
  --name /elasticache_challenge/master_password \
  --type SecureString \
  --value "MyB1gS3cr3t" \
  --description "Master Password for database" \
  --overwrite

# Get parameters from Parameter Store
aws ssm get-parameter \
  --name /elasticache_challenge/db_name \
  #--query Parameter.Value

aws ssm get-parameter \
  --name /elasticache_challenge/master_username \
  #--query Parameter.Value

aws ssm get-parameter \
  --with-decryption \
  --name /elasticache_challenge/master_password \
  #--query Parameter.Value
