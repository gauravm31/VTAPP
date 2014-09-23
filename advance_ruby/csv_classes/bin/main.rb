require_relative '../lib/dynamic_class_creator'

obj = DynamicClassCreator.new('persons.csv')
obj.create_class
obj.create_objects
obj.show_objects
