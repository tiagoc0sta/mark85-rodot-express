from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('')

db = ['markdb']

@keyword('Remove user from database')
def remove_user(email):
  users = db['users']
  users.delete_many({'email': email})
  print('removing user by '+ email)