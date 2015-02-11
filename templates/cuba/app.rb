require './config/application'

Cuba.define do
  on root do
    res.write 'Welcome'
  end
end
