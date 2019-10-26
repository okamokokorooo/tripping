json.array! @programs do |product|
  json.id program.id
  json.title program.title
  json.image program.image_url
end
