# config/initializers/swagger-docs.rb
Swagger::Docs::Config.register_apis({
  "2.0" => {
    :api_file_path => "public/",
    :base_path => "http://localhost:3000",
    :clean_directory => true,
    :attributes => {
      :info => {
        "title" => "Student forum",
        "description" => "Example rails app"
      }
    }
  }
})