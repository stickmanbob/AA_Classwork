json.extract! @user, :id, :username 

if flash[:errors]
    json.errors flash[:errors]
end