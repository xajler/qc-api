node(:status) { response.status }
node(:error)  { @error.to_json.html_safe }

node(:result) do
  yield
end
