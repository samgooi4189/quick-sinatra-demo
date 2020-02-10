require 'sinatra'

ENROLLED = {
"abc@example.com": "data science",
"def@example.com": "robotics",
"ghi@example.com": "maths",
"jkl@example.com": "programming",
"mno@example.com": "arts"
}

get '/' do
  erb "<form method=\"POST\" action=\"/check\">
    <p>Your Email: <input type=\"text\" name=\"email\"></p>
    <input type=\"submit\" value=\"Check status\">
  </form>"
end

post '/check' do
  email = params[:email]&.downcase
  redirect to("/result?email=#{email}")
end

get '/result' do
  email = params[:email]&.downcase.to_sym
  if ENROLLED.keys.include?(email)
    return "Congratz, you are enrolled to #{ENROLLED[email]}"
  end
end

__END__
@@ layout
<!DOCTYPE html>
<html><%= yield %></html>
