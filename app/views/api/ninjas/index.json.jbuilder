json.array! @ninjas do |ninja|
  json.extract! ninja, :id, :email
  json.targets ninja.targets, :id, :name, :is_completed
end
