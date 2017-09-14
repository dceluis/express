class Business < User
  has_one :adminitrator, class_name: "User"
end
