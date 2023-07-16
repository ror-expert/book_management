# app/views/post/index.rabl
collection :@books

attributes :id, :name, :description, :library
attributes :available?, as: :available
attributes :allocated_at, as: :checked_out_at

child(:library) { attributes :id, :name }
child(:users) { attributes :id, :first_name, :last_name, :email }
