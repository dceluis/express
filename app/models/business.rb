class Business < User
  has_one :adminitrator, class: "User"
end
