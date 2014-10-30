json.array! @results do |result|
  json._type result.class.to_s
  if result.class == Target
    json.extract! result, :id, :name, :is_completed, :ninja_id
  else # it's a Ninja
    json.extract! result, :id, :email
  end
end